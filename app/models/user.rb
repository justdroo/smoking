class User < ActiveRecord::Base

  # @@all = []
  #
  # attr_accessor :name, :last_smoke
  #
  # def initialize(params)
  #   @name = params[:name]
  #   @l_s_plain = params[:last_smoke].split("-")
  #   @last_smoke = Time.local(@l_s_plain[0],@l_s_plain[1], @l_s_plain[2] )
  #   @@all << self
  # end
  #
  # def last_smoke_date
  #   #"December 10, 1990."
  #   "#{@last_smoke.strftime('%B')} #{@last_smoke.strftime('%d')}, #{@last_smoke.strftime('%Y')}."
  # end
  #
  # def today
  #   #"December 10, 1990."
  #   @now = Time.now
  #       "#{@now.strftime('%B')} #{@now.strftime('%d')}, #{@now.strftime('%Y')}."
  # end
  #
  # def days_since
  #   @sec_diff = Time.now - @last_smoke
  #   mm, ss =@sec_diff.divmod(60)
  #   hh, mm = mm.divmod(60)
  #   dd, hh = hh.divmod(24)
  #   "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  # end
  #
  # def seconds_since
  #   @sec_diff = Time.now - @last_smoke
  #   "#{@sec_diff.to_f.round}"
  # end
end
