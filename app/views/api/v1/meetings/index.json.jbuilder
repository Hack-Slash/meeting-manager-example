json.array! @meetings do |meeting|
  json.id meeting.id
  json.notes meeting.notes
  json.address meeting.address
  json.name meeting.name
  json.start_time meeting.start_time
  json.start_time meeting.start_time
  json.end_time meeting.end_time
  json.tags meeting.tags
end
