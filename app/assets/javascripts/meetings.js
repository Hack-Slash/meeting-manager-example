document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: '#app',
    data: {
      meetings: [],
      nameSearch: '',
      sortAsc: true
    },
    mounted: function() {
      $.get('/api/v1/meetings', function(response) {
        console.log('response');
        console.log(response);
        this.meetings = response;
      }.bind(this));
    },
    computed: {
      modifiedMeetings: function() {
        return this.meetings.sort(function(meeting1, meeting2){
          if (this.sortAsc) {
            return meeting1.startTime > meeting2.startTime;
          } else {
            return meeting1.startTime < meeting2.startTime;
          }
        }.bind(this))
      }
    },
    methods: {
      isValidMeeting: function(inputMeeting) {
        return inputMeeting.name.toLowerCase().indexOf(this.nameSearch.toLowerCase()) > -1;
      },
      toggleStartTimeSort: function() {
        this.sortAsc = !this.sortAsc;
      }
    }
  });
});

