# -*- encoding : utf-8 -*-
shared_examples "rendering questions forms" do |*types|

  types.each do |type|
    it "renders the proper partial" do
      render
      expect(view).to render_template(partial: "_#{type}_form")
    end
  end
end
