require File.expand_path('../spec_helper', __FILE__)

describe CssController, type: :controller do
  after :all do
    Rails.root.join('tmp').rmtree
    Rails.root.join('log').rmtree
  end

  it "inlines assets" do
    get :test, file: 'inline'
    expect(response).to be_success
    expect(response.body).to eq ".icon{background:#{INLINE}}\n"
  end

  it "raises error on unknown file" do
    expect {
      get :test, file: 'wrong-inline'
    }.to raise_error(/Can't find asset no\.png/)
  end

  it "gets image size" do
    get :test, file: 'size'
    expect(response).to be_success
    expect(response.body).to eq ".icon{width:4px;height:6px}\n"
  end

  it "gets image size by mixin" do
    get :test, file: 'image-size'
    expect(response).to be_success
    expect(response.body).to eq ".icon{width:4px;height:6px}\n"
  end

  it "has hidpi-background mixin" do
    get :test, file: 'hidpi-background'
    expect(response).to be_success
    expect(response.body).to eq ".icon{" +
      "background-image:url(/assets/monolith.png);" +
      "background-size:2px 3px}\n"
  end

  it "has hidpi-image mixin" do
    get :test, file: 'hidpi-image'
    expect(response).to be_success
    expect(response.body).to eq ".icon{" +
      "width:2px;height:3px;" +
      "background-image:url(/assets/monolith.png);" +
      "background-size:2px 3px;" +
      "background-repeat:no-repeat}\n"
  end

  it "has hidpi-inline mixin" do
    get :test, file: 'hidpi-inline'
    expect(response).to be_success
    expect(response.body).to eq ".icon{" +
      "width:2px;height:3px;" +
      "background:#{INLINE} no-repeat;" +
      "background-size:2px 3px}\n"
  end
end
