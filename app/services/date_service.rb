class DateService
  DATE_OPTIONS = {
    '1day' => 1.days.ago.to_date,
    '7days' => 7.days.ago.to_date,
    '30days' => 30.days.ago.to_date
  }.freeze

  def initialize(params)
    @date = params[:@date]
  end

  def call
    return Record.all if date.blank?

    Record.where(date: @date..Date.today)
  end

  private

  attr_reader :date
end
