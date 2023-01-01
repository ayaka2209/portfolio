class AttendanceBooksController < ApplicationController

  def index
    @attedancebooks = AttendanceBook.all
    @done_attendance_kids = AttendanceBook.where(start_time: Date.current).pluck(:kid_id)
    if params[:day_date] && params[:class_name]
      the_day_attendance_datas = AttendanceBook.where(start_time: params[:day_date])
      the_kids = Kid.where(team_id: "#{Team.find_by(name: params[:class_name]).id}")
      @attendancebooks_teams = the_day_attendance_datas.where(kid_id: the_kids)
      @day_date = params[:day_date]
      @team_name = params[:class_name]
    end
  end
end
