# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:test_report)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end

  test '#created_on' do
    assert @report.created_on.instance_of?(Date)
    assert_equal @report.created_on, @report.created_at.to_date
  end
end
