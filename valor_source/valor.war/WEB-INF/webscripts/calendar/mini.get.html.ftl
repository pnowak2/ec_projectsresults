<script type="text/javascript">
      $(document).ready(function () {
          // Create calendar.
          $("#calendar").jqxCalendar({ enableTooltips: true, width: 220, height: 220, theme: 'energyblue' });
          // Create Date objects.
          var date1 = new Date();
          var date2 = new Date();
          var date3 = new Date();
          date1.setDate(5);
          date2.setDate(15);
          date3.setDate(16);
          // Add special dates by invoking the addSpecialDate method.
          $("#calendar").jqxCalendar('addSpecialDate', date1, '', 'Special Date1');
          $("#calendar").jqxCalendar('addSpecialDate', date2, '', 'Special Date2');
          $("#calendar").jqxCalendar('addSpecialDate', date3, '', 'Special Date3');
      });
</script>
<div class="services-box">
	<h3>CE Calendar</h3>
	<p>Take a look at our Events</p>			
</div>
<div id="calendar"></div>
