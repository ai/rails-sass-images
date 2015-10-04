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

    @assets.context_class.instance_eval do
      def sass_config
        { }
      end
    end
  end

  after do
    RailsSassImages.load_from = @original
  end

  describe 'assets loading' do

    it "loads from dir" do
      RailsSassImages.load_from = DIR.join('app/app/assets/images')
      expect(@assets['size.css'].to_s).to eq ".icon{width:4px;height:6px}\n"
    end

    it "loads by default from current dir" do
      RailsSassImages.load_from = '.'
      expect(@assets['relative.css'].to_s).to eq ".icon{width:4px;height:6px}\n"
    end

    it "loads assets from sprockets" do
      RailsSassImages.load_from = @assets
      expect(@assets['size.css'].to_s).to eq ".icon{width:4px;height:6px}\n"
    end

    it "loads assets lazy" do
      RailsSassImages.load_from = proc { @assets }
      expect(@assets['size.css'].to_s).to eq ".icon{width:4px;height:6px}\n"
    end

    it "raises error on unknown file in assets" do
      RailsSassImages.load_from = @assets
      expect {
        @assets['wrong-inline.css']
      }.to raise_error(/Can't find asset no\.png/)
    end

    it "raises error on unknown file in path" do
      RailsSassImages.load_from = '.'
      expect {
        @assets['wrong-inline.css']
      }.to raise_error(/Can't find asset no\.png in \./)
    end

  end

  describe 'mixins' do
    before do
      RailsSassImages.install(@assets)
    end

    it "inlines assets" do
      expect(@assets['inline.css'].to_s).to eq ".icon{background:#{INLINE}}\n"
    end

    it "inlines SVG" do
      expect(@assets['inline-svg.css'].to_s).to eq ".icon{background:#{INLINE_SVG}}\n"
    end

    it "gets image size" do
      expect(@assets['size.css'].to_s).to eq ".icon{width:4px;height:6px}\n"
    end

    it "gets image size by mixin" do
      expect(@assets['image-size.css'].to_s).to eq(
        ".icon{width:4px;height:6px}\n")
    end

    it "has hidpi-background mixin" do
      expect(@assets['hidpi-background.css'].to_s).to eq (".icon{" +
        "background-image:url(/assets/monolith.png);" +
        "background-size:2px 3px}\n")
    end

    it "has hidpi-image mixin" do
      expect(@assets['hidpi-image.css'].to_s).to eq ".icon{" +
        "width:2px;height:3px;" +
        "background-image:url(/assets/monolith.png);" +
        "background-size:2px 3px;" +
        "background-repeat:no-repeat}\n"
    end

    it "has hidpi-inline mixin" do
      expect(@assets['hidpi-inline.css'].to_s).to eq ".icon{" +
        "width:2px;height:3px;" +
        "background:#{INLINE} no-repeat;" +
        "background-size:2px 3px}\n"
    end

  end
end
