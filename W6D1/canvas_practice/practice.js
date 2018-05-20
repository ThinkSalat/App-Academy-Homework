document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('myCanvas');
  canvas.height = 500;
  canvas.width = 500;

  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'purple';
  ctx.fillRect(50,50,400,400);

      ctx.beginPath();

      ctx.moveTo(250,250);
      ctx.arc(250, 250, 50, 0, Math.PI * 2, true); // Outer circle
      // ctx.moveTo(110+250, 75+250);
      ctx.arc(75+175, 75+175, 35, 0, Math.PI, false);  // Mouth (clockwise)
      ctx.moveTo(65+175, 65+175);
      ctx.arc(60+175, 65+175, 5, 0, Math.PI * 2, true);  // Left eye
      ctx.moveTo(95+175, 65+175);
      ctx.arc(90+175, 65+175, 5, 0, Math.PI * 2, true);  // Right eye
      ctx.strokeStyle = 'yellow';
      // ctx.lineWidth = 2;
      ctx.fillStyle = 'green';
      ctx.fill();
      ctx.stroke();

});
