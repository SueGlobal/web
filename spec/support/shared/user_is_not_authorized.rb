shared_examples "user is not authorized" do

  it "redirects to root" do
    response.should redirect_to(root_path)
  end

  it "sets flash[:notice]" do
    flash.notice.should_not be_blank
  end
end
