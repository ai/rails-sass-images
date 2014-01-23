require File.expand_path('../spec_helper', __FILE__)

require 'sprockets'

describe RailsSassImages do
  before do
    @original = RailsSassImages.load_from

    @assets = Sprockets::Environment.new
    @assets.append_path(DIR.join('app/app/assets/images'))
    @assets.append_path(DIR.join('app/app/assets/stylesheets'))
    @assets.css_compressor = :sass

    @assets.context_class.class_eval do
      def asset_path(path, options = {})
        "/assets/#{path}"
      end
    end
  end

  after do
    RailsSassImages.load_from = @original
  end

  describe 'assets loading' do

    it "loads from dir" do
      RailsSassImages.load_from = DIR.join('app/app/assets/images')
      @assets['size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "loads by default from current dir" do
      RailsSassImages.load_from = '.'
      @assets['relative.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "loads assets from sprockets" do
      RailsSassImages.load_from = @assets
      @assets['size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "loads assets lazy" do
      RailsSassImages.load_from = proc { @assets }
      @assets['size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "raises error on unknown file in assets" do
      RailsSassImages.load_from = @assets
      proc {
        @assets['wrong-inline.css']
      }.should raise_error(/Can't find asset no\.png/)
    end

    it "raises error on unknown file in path" do
      RailsSassImages.load_from = '.'
      proc {
        @assets['wrong-inline.css']
      }.should raise_error(/Can't find asset no\.png in \./)
    end

  end

  describe 'mixins' do
    before do
      RailsSassImages.install(@assets)
    end

    it "inlines assets" do
      @assets['inline.css'].to_s.should == ".icon{background:#{INLINE}}\n"
    end

    it "gets image size" do
      @assets['size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "gets image size by mixin" do
      @assets['image-size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
    end

    it "has hidpi-background mixin" do
      @assets['hidpi-background.css'].to_s.should == (".icon{" +
        "background-image:url(/assets/monolith.png);" +
        "background-size:2px 3px}\n")
    end

    it "has hidpi-image mixin" do
      @assets['hidpi-image.css'].to_s.should == ".icon{" +
        "width:2px;height:3px;" +
        "background-image:url(/assets/monolith.png);" +
        "background-size:2px 3px;" +
        "background-repeat:no-repeat}\n"
    end

    it "has hidpi-inline mixin" do
      @assets['hidpi-inline.css'].to_s.should == ".icon{" +
        "width:2px;height:3px;" +
        "background:#{INLINE} no-repeat;" +
        "background-size:2px 3px}\n"
    end

  end
end
