%FaceFlankerTask3-BrainRoom

try
  %画面使用
  %Setting this preference to 1 suppresses the printout of warnings.
  %エラーチェックをはずす
  oldLevel = Screen('Preference', 'Verbosity', 0);
  %同期チェックをスキップ
  Screen('Preference', 'SkipSyncTests', 2);
  %初期画面をブラックに設定（オープニング画面のスキップ）
  Screen('Preference', 'VisualDebugLevel', 1);
  AssertOpenGL;
  ListenChar(2); %Octaveに対するキー入力を無効 
  screenNumber = max(Screen('Screens'));
  
  %ウィンドウの開始前に、ウィンドウハンドルの変数をクリア
  %if exist('win', 'var')
    %sca; % 古いウィンドウを閉じる
    %ListenChar(0);
    %clear win;
  %end
  
  %ウィンドウの開始前に、ウィンドウハンドルの変数を宣言
  win = [];
    
  %刺激提示ウィンドウの用意と座標設定
  [win, rec] = Screen('OpenWindow',0);

  %画面の中心座標を取得
  [xcenter,ycenter] = RectCenter(rec);
  
  %中央座標から注視点ようの座標を算出して行列にいれる  
  fixposition = [xcenter-10 ycenter-10 xcenter+10 ycenter+10];
  xy = [xcenter-10 xcenter+10 xcenter xcenter;
          ycenter ycenter ycenter-10 ycenter+10];
  rect=[20 20 rec(3) rec(4)];      
  Screen('TextSize',win,36);
  black = [0 0 0];
  white = [255 255 255];
  red = [155 0 0];
  
%画像の読み込み
AngAngCon = imread('Ang-AngCon.png');
AngAngFear = imread('Ang-AngFear.png');
AngAngSmai = imread('Ang-AngSmai.png');
AngAngSur = imread('Ang-AngSur.png');
AngConAng = imread('Ang-ConAng.png');
AngFearAng = imread('Ang-FearAng.png');
AngSmaiAng = imread('Ang-SmaiAng.png');
AngSurAng = imread('Ang-SurAng.png');
ConAngCon = imread('Con-AngCon.png');
ConConAng = imread('Con-ConAng.png');
ConConFear = imread('Con-ConFear.png');
ConConSmai = imread('Con-ConSmai.png');
ConConSur = imread('Con-ConSur.png');
ConFearCon = imread('Con-FearCon.png');
ConSmaiCon = imread('Con-SmaiCon.png');
ConSurCon = imread('Con-SurCon.png');
FearAngFear = imread('Fear-AngFear.png');
FearConFear = imread('Fear-ConFear.png');
FearFearAng = imread('Fear-FearAng.png');
FearFearCon = imread('Fear-FearCon.png');
FearFearSmai = imread('Fear-FearSmai.png');
FearFearSur = imread('Fear-FearSur.png');
FearSmaiFear = imread('Fear-SmaiFear.png');
FearSurFear = imread('Fear-SurFear.png');
SmaiAngSmai = imread('Smai-AngSmai.png');
SmaiConSmai = imread('Smai-ConSmai.png');
SmaiFearSmai = imread('Smai-FearSmai.png');
SmaiSmaiAng = imread('Smai-SmaiAng.png');
SmaiSmaiCon = imread('Smai-SmaiCon.png');
SmaiSmaiFear = imread('Smai-SmaiFear.png');
SmaiSmaiSur = imread('Smai-SmaiSur.png');
SmaiSurSmai = imread('Smai-SurSmai.png');
SurAngSur = imread('Sur-AngSur.png');
SurConSur = imread('Sur-ConSur.png');
SurFearSur = imread('Sur-FearSur.png');
SurSmaiSur = imread('Sur-SmaiSur.png');
SurSurAng = imread('Sur-SurAng.png');
SurSurCon = imread('Sur-SurCon.png');
SurSurFear = imread('Sur-SurFear.png');
SurSurSmai = imread('Sur-SurSmai.png');

AngAngCon = Screen('MakeTexture', win, AngAngCon);
AngAngFear = Screen('MakeTexture', win, AngAngFear);
AngAngSmai = Screen('MakeTexture', win, AngAngSmai);
AngAngSur = Screen('MakeTexture', win, AngAngSur);
AngConAng = Screen('MakeTexture', win, AngConAng);
AngFearAng = Screen('MakeTexture', win, AngFearAng);
AngSmaiAng = Screen('MakeTexture', win, AngSmaiAng);
AngSurAng = Screen('MakeTexture', win, AngSurAng);
ConAngCon = Screen('MakeTexture', win, ConAngCon);
ConConAng = Screen('MakeTexture', win, ConConAng);
ConConFear = Screen('MakeTexture', win, ConConFear);
ConConSmai = Screen('MakeTexture', win, ConConSmai);
ConConSur = Screen('MakeTexture', win, ConConSur);
ConFearCon = Screen('MakeTexture', win, ConFearCon);
ConSmaiCon = Screen('MakeTexture', win, ConSmaiCon);
ConSurCon = Screen('MakeTexture', win, ConSurCon);
FearAngFear = Screen('MakeTexture', win, FearAngFear);
FearConFear = Screen('MakeTexture', win, FearConFear);
FearFearAng = Screen('MakeTexture', win, FearFearAng);
FearFearCon = Screen('MakeTexture', win, FearFearCon);
FearFearSmai = Screen('MakeTexture', win, FearFearSmai);
FearFearSur = Screen('MakeTexture', win, FearFearSur);
FearSmaiFear = Screen('MakeTexture', win, FearSmaiFear);
FearSurFear = Screen('MakeTexture', win, FearSurFear);
SmaiAngSmai = Screen('MakeTexture', win, SmaiAngSmai);
SmaiConSmai = Screen('MakeTexture', win, SmaiConSmai);
SmaiFearSmai = Screen('MakeTexture', win, SmaiFearSmai);
SmaiSmaiAng = Screen('MakeTexture', win, SmaiSmaiAng);
SmaiSmaiCon = Screen('MakeTexture', win, SmaiSmaiCon);
SmaiSmaiFear = Screen('MakeTexture', win, SmaiSmaiFear);
SmaiSmaiSur = Screen('MakeTexture', win, SmaiSmaiSur);
SmaiSurSmai = Screen('MakeTexture', win, SmaiSurSmai);
SurAngSur = Screen('MakeTexture', win, SurAngSur);
SurConSur = Screen('MakeTexture', win, SurConSur);
SurFearSur = Screen('MakeTexture', win, SurFearSur);
SurSmaiSur = Screen('MakeTexture', win, SurSmaiSur);
SurSurAng = Screen('MakeTexture', win, SurSurAng);
SurSurCon = Screen('MakeTexture', win, SurSurCon);
SurSurFear = Screen('MakeTexture', win, SurSurFear);
SurSurSmai = Screen('MakeTexture', win, SurSurSmai);

  
  %プログラム開始時にキーコードを代入しておく
  %KbName('UnifyKeyName');
  spaceKey=KbName('space');
  aKey=KbName('A');
  sKey=KbName('S');
  dKey=KbName('D');
  fKey=KbName('F');
  hKey=KbName('H');
  jKey=KbName('J');
  kKey=KbName('K');
  lKey=KbName('L');
  escapekey = KbName('escape');
  
 fid = fopen('Practice9_20.csv', 'at');
%%%%%%%%%%%%%%%%%%%%%%%%
  %カーソルを隠す
  HideCursor();

  while 1
    [keyIsDown, secs, keycode] = KbCheck;
    if keycode(KbName('space'))
      break;
        sea;
        ListenChar(0);
      return
    end;
   end
%%%%%%%%%%%%%%%%%%%%%%%%

  %何も表示しない画面呈示
  Screen('Flip', win);
  WaitSecs(1);
  
%%%%%%%%%%%%%%%%
  %注視点提示
  %Screen('DrawLines', win, fixposition, black);
  %Screen('FillRect', win);
  %Screen('DrawLines',win,fixposition,2,black);
  %Screen('Filp',win);
  %Screen('FillRect',win,white);
  %WaitSecs(0.5);
  
  %注視点提示
  %FixCr=ones(20,20)*255;
  %FixCr(10:11,:)=0;
  %FixCr(:,10:11)=0; %try imagesc(FixCr) to display the result in Matlab
  %fixcross = Screen('MakeTexture',win,FixCr);
  
  %キー情報の取得
  [keyIsDoen,keyTime,keycode] = KbCheck;

%%%%%%%%%%%%%%%%%
  while 1
  [keyIsDown, secs, keycode] = KbCheck;
  Screen('DrawText',win,'Please enter spacekey when you are ready.',xcenter-400,ycenter,red);
  Screen('Flip',win);
    if keycode(KbName('space'))
      break;
      elseif keycode(KbName('escape'))
      sca;
      ListenChar(0);
      error('Program terminated by user.');
    end;
  end

%%%%%%%%%%%%%%%%%
 %注視点提示
 %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  
 %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(5);
%%%%%%%%%%%%%%%%%%%%%%%%
 %練習試行   
 %第一ブロック
  
  b=zeros(1,80);
  b(1, 1:2) = 1;
b(1, 3:4) = 2;
b(1, 5:6) = 3;
b(1, 7:8) = 4;
b(1, 9:10) = 5;
b(1, 11:12) = 6;
b(1, 13:14) = 7;
b(1, 15:16) = 8;
b(1, 17:18) = 9;
b(1, 19:20) = 10;
b(1, 21:22) = 11;
b(1, 23:24) = 12;
b(1, 25:26) = 13;
b(1, 27:28) = 14;
b(1, 29:30) = 15;
b(1, 31:32) = 16;
b(1, 33:34) = 17;
b(1, 35:36) = 18;
b(1, 37:38) = 19;
b(1, 39:40) = 20;
b(1, 41:42) = 21;
b(1, 43:44) = 22;
b(1, 45:46) = 23;
b(1, 47:48) = 24;
b(1, 49:50) = 25;
b(1, 51:52) = 26;
b(1, 53:54) = 27;
b(1, 55:56) = 28;
b(1, 57:58) = 29;
b(1, 59:60) = 30;
b(1, 61:62) = 31;
b(1, 63:64) = 32;
b(1, 65:66) = 33;
b(1, 67:68) = 34;
b(1, 69:70) = 35;
b(1, 71:72) = 36;
b(1, 73:74) = 37;
b(1, 75:76) = 38;
b(1, 77:78) = 39;
b(1, 79:80) = 40;

  r=randperm(80);
  
for i = 1:80
  a=b (r(i))

    Screen('FillRect',win,white);
     distract = '';
    
    if a == 1
    Screen('DrawTexture', win, AngAngCon,[],rect);
    distract='AngAngCon'
elseif a == 2
    Screen('DrawTexture', win, AngAngFear,[],rect);
    distract='AngAngFear'
elseif a == 3
    Screen('DrawTexture', win, AngAngSmai,[],rect);
    distract='AngAngSmai'
elseif a == 4
    Screen('DrawTexture', win, AngAngSur,[],rect);
    distract='AngAngSur'
elseif a == 5
    Screen('DrawTexture', win, AngConAng,[],rect);
    distract='AngConAng'
elseif a == 6
    Screen('DrawTexture', win, AngFearAng,[],rect);
    distract='AngFearAng'
elseif a == 7
    Screen('DrawTexture', win, AngSmaiAng,[],rect);
    distract='AngSmaiAng'
elseif a == 8
    Screen('DrawTexture', win, AngSurAng,[],rect);
    distract='AngSurAng'
elseif a == 9
    Screen('DrawTexture', win, ConAngCon,[],rect);
    distract='ConAngCon'
elseif a == 10
    Screen('DrawTexture', win, ConConAng,[],rect);
    distract='ConConAng'
elseif a == 11
    Screen('DrawTexture', win, ConConFear,[],rect);
    distract='ConConFear'
elseif a == 12
    Screen('DrawTexture', win, ConConSmai,[],rect);
    distract='ConConSmai'
elseif a == 13
    Screen('DrawTexture', win, ConConSur,[],rect);
    distract='ConConSur'
elseif a == 14
    Screen('DrawTexture', win, ConFearCon,[],rect);
    distract='ConFearCon'
elseif a == 15
    Screen('DrawTexture', win, ConSmaiCon,[],rect);
    distract='ConSmaiCon'
elseif a == 16
    Screen('DrawTexture', win, ConSurCon,[],rect);
    distract='ConSurCon'
elseif a == 17
    Screen('DrawTexture', win, FearAngFear,[],rect);
    distract='FearAngFear'
elseif a == 18
    Screen('DrawTexture', win, FearConFear,[],rect);
    distract='FearConFear'
elseif a == 19
    Screen('DrawTexture', win, FearFearAng,[],rect);
    distract='FearFearAng'
elseif a == 20
    Screen('DrawTexture', win, FearFearCon,[],rect);
    distract='FearFearCon'
elseif a == 21
    Screen('DrawTexture', win, FearFearSmai,[],rect);
    distract='FearFearSmai'
elseif a == 22
    Screen('DrawTexture', win, FearFearSur,[],rect);
    distract='FearFearSur'
elseif a == 23
    Screen('DrawTexture', win, FearSmaiFear,[],rect);
    distract='FearSmaiFear'
elseif a == 24
    Screen('DrawTexture', win, FearSurFear,[],rect);
    distract='FearSurFear'
elseif a == 25
    Screen('DrawTexture', win, SmaiAngSmai,[],rect);
    distract='SmaiAngSmai'
elseif a == 26
    Screen('DrawTexture', win, SmaiConSmai,[],rect);
    distract='SmaiConSmai'
elseif a == 27
    Screen('DrawTexture', win, SmaiFearSmai,[],rect);
    distract='SmaiFearSmai'
elseif a == 28
    Screen('DrawTexture', win, SmaiSmaiAng,[],rect);
    distract='SmaiSmaiAng'
elseif a == 29
    Screen('DrawTexture', win, SmaiSmaiCon,[],rect);
    distract='SmaiSmaiCon'
elseif a == 30
    Screen('DrawTexture', win, SmaiSmaiFear,[],rect);
    distract='SmaiSmaiFear'
elseif a == 31
    Screen('DrawTexture', win, SmaiSmaiSur,[],rect);
    distract='SmaiSmaiSur'
elseif a == 32
    Screen('DrawTexture', win, SmaiSurSmai,[],rect);
    distract='SmaiSurSmai'
elseif a == 33
    Screen('DrawTexture', win, SurAngSur,[],rect);
    distract='SurAngSur'
elseif a == 34
    Screen('DrawTexture', win, SurConSur,[],rect);
    distract='SurConSur'
elseif a == 35
    Screen('DrawTexture', win, SurFearSur,[],rect);
    distract='SurFearSur'
elseif a == 36
    Screen('DrawTexture', win, SurSmaiSur,[],rect);
    distract='SurSmaiSur'
elseif a == 37
    Screen('DrawTexture', win, SurSurAng,[],rect);
    distract='SurSurAng'
elseif a == 38
    Screen('DrawTexture', win, SurSurCon,[],rect);
    distract='SurSurCon'
elseif a == 39
    Screen('DrawTexture', win, SurSurFear,[],rect);
    distract='SurSurFear'
elseif a == 40
    Screen('DrawTexture', win, SurSurSmai,[],rect);
    distract='SurSurSmai'
   end%%ifのend

   Screen('Flip',win);
   start = GetSecs;

 %%%%%%%%%%%%%%%%%%%%%%%%
  while 1
    [keyIsDown,secs,keycode] = KbCheck;
    rt = 1000*(GetSecs-start);
  if keyIsDown
   if keycode(KbName('F')) && a == 1;
      answer = 'true'
      Screen('DrawLines', win, xy ,2, black);
      Screen('Flip',win);
        break;
    elseif keycode(KbName('J')) && a == 1;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 2;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 2;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 3;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 3;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 4;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 4;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 5;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 5;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 6;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 6;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 7;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 7;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 8;
        answer = 'wrong'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 8;
        answer = 'true'
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 9
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 9
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 10
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 10
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 11
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 11
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 12
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 12
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 13
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 13
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 14
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 14
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 15
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 15
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 16
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 16
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 17
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 17
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 18
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 18
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 19
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 19
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 20
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 20
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 21
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 21
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 22
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 22
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 23
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 23
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 24
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 24
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 25
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 25
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 26
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 26
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 27
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 27
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 28
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 28
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 29
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 29
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 30
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 30
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 31
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 31
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 32
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 32
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 33
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 33
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 34
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 34
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 35
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 35
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 36
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 36
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 37
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 37
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 38
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 38
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 39
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 39
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 40
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 40
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    
    elseif keycode(KbName('escape'))
    sca;
    ListenChar(0);

    %error('Program terminated by user.');
    break;
    end%%ifのend
   end%%whileのend
  end%%ifのend
   
  WaitSecs(1);
  fprintf(fid,'%s,%f,%s\n',distract,rt,answer);
  
  end

   WaitSecs(1);
   
   fclose(fid);
   sca; %ScreenCloseAllの略
   ListenChar(0);
   
  catch
  
  sca;
  ListenChar(0);
  %エラーを表示する
  psychrethrow(psychlasterror);
  
end%tryのend

%カーソルを表示する前にウィンドウを閉じる
sca;
ListenChar(0);
%ウィンドウハンドルをクリア
win = [];

