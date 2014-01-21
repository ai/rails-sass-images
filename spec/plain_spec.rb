require File.expand_path('../spec_helper', __FILE__)

require 'sprockets'

describe RailsSassImages do
  before do
    @original = RailsSassImages.assets

    @assets = Sprockets::Environment.new
    @assets.append_path(DIR.join('app/app/assets/images'))
    @assets.append_path(DIR.join('app/app/assets/stylesheets'))
    @assets.css_compressor = :sass

    @assets.context_class.class_eval do
      def asset_path(path, options = {})
        "/assets/#{path}"
      end
    end

    RailsSassImages.install(@assets)
  end

  after do
    RailsSassImages.assets        = @original
    RailsSassImages.assets_loader = nil
  end

  it "loads assets lazy" do
    RailsSassImages.assets = nil
    another = Sprockets::Environment.new

    RailsSassImages.assets_loader = proc { another }

    RailsSassImages.assets.should == another
  end

  it "inlines assets" do
    @assets['inline.css'].to_s.should == ".icon{background:#{INLINE}}\n"
  end

  it "raises error on unknown file" do
    proc {
      @assets['wrong-inline.css']
    }.should raise_error(/Can't find asset no\.png/)
  end

  it "gets image size" do
    @assets['size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
  end

  it "gets image size by mixin" do
    @assets['image-size.css'].to_s.should == ".icon{width:4px;height:6px}\n"
  end

  it "has hidpi-image mixin" do
    @assets['hidpi-image.css'].to_s == ".icon{width:2px;height:3px;" +
      "background:url(/assets/monolith.png) no-repeat;" +
      "background-size:2px 3px}\n"
  end

  it "has hidpi-inline mixin" do
    @assets['hidpi-inline.css'].to_s.should == ".icon{width:2px;height:3px;" +
      "background:#{INLINE} no-repeat;" +
      "background-size:2px 3px}\n"
  end
end
