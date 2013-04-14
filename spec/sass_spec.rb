require File.expand_path('../spec_helper', __FILE__)

describe CssController, :type => :controller do
  describe 'inline()' do
    it "should inline assets" do
      get :test, :file => 'inline'
      response.should be_success
      response.body.should == ".icon{background:url('data:image/png;base64," +
        "iVBORw0KGgoAAAANSUhEUgAAAAIAAAADCAAAAACcgYFdAAAAC0lEQVQI12NggAIAAAkA" +
        "AWMqFg0AAAAASUVORK5CYII=')}\n"
    end

    it "should raise error on unknown file" do
      proc {
        get :test, :file => 'wrong_inline'
      }.should raise_error(/Can't find asset no\.png/)
    end
  end
end
