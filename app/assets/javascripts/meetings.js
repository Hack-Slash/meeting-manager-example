document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: '#app',
    data: {
      meetings: []
    },
    mounted: function() {
      $.get('/api/v1/meetings', function(response) {
        console.log('response');
        console.log(response);
        this.meetings = response;
      }.bind(this))
    }
  });
});

