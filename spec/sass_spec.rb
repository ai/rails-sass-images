require File.expand_path('../spec_helper', __FILE__)

describe CssController, :type => :controller do
  after :all do
    Rails.root.join('tmp').rmtree
    Rails.root.join('log').rmtree
  end

  it "should inline assets" do
    get :test, :file => 'inline'
    response.should be_success
    response.body.should == ".icon{background:#{INLINE}}\n"
  end

  it "should raise error on unknown file" do
    proc {
      get :test, :file => 'wrong-inline'
    }.should raise_error(/Can't find asset no\.png/)
  end

  it "should get image size" do
    get :test, :file => 'size'
    response.should be_success
    response.body.should == ".icon{width:4px;height:6px}\n"
  end

  it "should get image size by mixin" do
    get :test, :file => 'image-size'
    response.should be_success
    response.body.should == ".icon{width:4px;height:6px}\n"
  end

  it "should has hidpi-image mixin" do
    get :test, :file => 'hidpi-image'
    response.should be_success
    response.body.should == ".icon{width:2px;height:3px;" +
      "background:url(/assets/monolith.png) no-repeat;" +
      "background-size:2px 3px}\n"
  end

  it "should has hidpi-inline mixin" do
    get :test, :file => 'hidpi-inline'
    response.should be_success
    response.body.should == ".icon{width:2px;height:3px;" +
      "background:#{INLINE} no-repeat;" +
      "background-size:2px 3px}\n"
  end
end
