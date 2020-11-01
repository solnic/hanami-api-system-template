# frozen_string_literal: true

RSpec.describe "/ping", :web do
  it "works" do
    get "/ping"

    expect(response.status).to be(200)
    expect(response.body).to eql("ok")
  end
end
