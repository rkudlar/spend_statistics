class RecordsService
  DATE_OPTIONS = {
    '1day' => 1.days.ago.to_date,
    '7days' => 7.days.ago.to_date,
    '30days' => 30.days.ago.to_date,
    '365days' => 365.days.ago.to_date
  }.freeze

  def initialize(params)
    @category_id = params[:category_id]
    @date = params[:date]
  end

  def call
    if !category_id.blank?
      Record.where(category_id: @category_id)
    elsif !date.blank?
      Record.where(date: (DATE_OPTIONS[@date]..Date.today))
    else
      Record.all
    end
  end

  private

  attr_reader :category_id, :date
end
