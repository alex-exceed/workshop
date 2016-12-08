require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    @event = FactoryGirl.create(:event)
    assign(:events, [@event, @event])
  end

  it "displays the name, the eventkind, the timespan and the status" do
    render
    assert_select "td", :text => @event.name
    assert_select "td", :text => @event.kind
    assert_select "td", :date => @event.start_date
    assert_select "td", :date => @event.end_date
    assert_select "td", :boolean => @event.draft
  end
end
