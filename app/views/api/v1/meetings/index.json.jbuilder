json.array! @meetings do |meeting|
  json.id meeting.id
  json.notes meeting.notes
  json.address meeting.address
  json.name meeting.name
  json.startTime meeting.start_time
  json.endTime meeting.end_time
  json.tags meeting.tags
end
