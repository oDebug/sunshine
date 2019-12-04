   /* horizontal to vertical */
   $('#label1h').click(function() {
    console.log('label1h');
    if ($('#labelv2').hasClass('btn btn-secondary active')) {
      $('#labelv2').toggleClass('active');
      console.log('labelv2 deactivated');
    } else if ($('#labelv3').hasClass('btn btn-secondary active')) {
      $('#labelv3').toggleClass('active');
      console.log('labelv3 deactivated');
    }
    $('#labelv1').toggleClass('btn btn-secondary active', true);
    console.log('labelv1 class ' + $('#labelv1').className);
  });
  $('#label2h').click(function() {
    console.log('label2h');
    if ($('#labelv1').hasClass('btn btn-secondary active')) {
      $('#labelv1').toggleClass('active');
      console.log('labelv1 deactivated');
    } else if ($('#labelv3').hasClass('btn btn-secondary active')) {
      $('#labelv3').toggleClass('active');
      console.log('labelv3 deactivated');
    }
    $('#labelv2').toggleClass('btn btn-secondary active', true);
  });
  $('#label3h').click(function() {
    console.log('label3h');
    if ($('#labelv1').hasClass('btn btn-secondary active')) {
      $('#labelv1').toggleClass('active');
      console.log('labelv1 deactivated');
    } else if ($('#labelv2').hasClass('btn btn-secondary active')) {
      $('#labelv2').toggleClass('active');
      console.log('labelv2 deactivated');
    }
    $('#labelv3').toggleClass('btn btn-secondary active', true);
    console.log('labelv3 class ' + $('#labelv3').className);
  });
  /* vertical to horizontal */
  $('#labelv1').click(function() {
    console.log('labelv1');
    if ($('#label2h').hasClass('btn btn-secondary active')) {
      $('#label2h').toggleClass('active');
      console.log('label2h deactivated');
    } else if ($('#label3h').hasClass('btn btn-secondary active')) {
      $('#label3h').toggleClass('active');
      console.log('label3h deactivated');
    }
    $('#label1h').toggleClass('btn btn-secondary active', true);
    console.log('label1h class ' + $('#label1h').className);
  });
  $('#labelv2').click(function() {
    console.log('labelv2');
    if ($('#label1h').hasClass('btn btn-secondary active')) {
      $('#label1h').toggleClass('active');
      console.log('label1h deactivated');
    } else if ($('#label3h').hasClass('btn btn-secondary active')) {
      $('#label3h').toggleClass('active');
      console.log('label3h deactivated');
    }
    $('#label2h').toggleClass('btn btn-secondary active', true);
  });
  $('#labelv3').click(function() {
    console.log('labelv3');
    if ($('#label1h').hasClass('btn btn-secondary active')) {
      $('#label1h').toggleClass('active');
      console.log('label1h deactivated');
    } else if ($('#label2h').hasClass('btn btn-secondary active')) {
      $('#label2h').toggleClass('active');
      console.log('label2h deactivated');
    }
    $('#label3h').toggleClass('btn btn-secondary active', true);
    console.log('label3h class ' + $('#label3h').className);
  });