uses GraphWPF;

var Px := 100.0;
var Py := 100.0;
var Ex := 600.0;
var Ey := 400.0;
var mas := 50.0;
var bool := false;

procedure EnemyAi;
begin
  if (Px > Ex) then
    Ex += 1
  else
    Ex -= 1;
  
  if (Py > Ey) then
    Ey += 1
  else
    Ey -= 1;
end;

procedure Player;
begin
  DrawImage(Px,Py,mas,mas,'и Мышки.png');
  DrawImage(Ex,Ey,mas*1.5,mas*1.5,'и Кошки.png');
  
  //EnemyAi;
  if (Px = Ex) and (Py = Ey) then
  begin
    EndFrameBasedAnimation;
    DrawText(400,300,25,25,'Кошка выйграла',colors.Red);
    bool := true;
  end;
end;

procedure KeyPress(c:char);
begin
  case c of
    'w': Py -= mas;
    's': Py += mas;
    'd': Px += mas;
    'a': Px -= mas;
    
    'i': Ey -= mas;
    'k': Ey += mas;
    'l': Ex += mas;
    'j': Ex -= mas;
  end;
end;


begin
  OnKeyPress := KeyPress;
  BeginFrameBasedAnimation(Player);
  Sleep(10000);
  if bool = false then
  begin
    EndFrameBasedAnimation;
    DrawText(400,300,25,25,'Мышка выйграла',colors.Green);
  end;
end. 