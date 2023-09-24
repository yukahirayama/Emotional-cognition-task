%EmotionFaceTask4-BrainRoom

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
  #if exist('win', 'var')
    #sca; % 古いウィンドウを閉じる
    #ListenChar(0);
    #clear win;
  #end
  
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
  rect=[40 20 rec(3) rec(4)];      
  Screen('TextSize',win,36);
  black = [0 0 0];
  white = [255 255 255];
  red = [155 0 0];
  
  %画像の読み込み
  SurSmaiSur = imread('16Sur.10Smai.13Sur.png');
  [yPixel, xPixel, Color] = size(SurSmaiSur);
  
  SurSurSmai = imread('16Sur.13Sur.10 Smai.png');
  [yPixel, xPixel, Color] = size(SurSurSmai);
  %imdata1 = imresize(imdata1, [25 75]);
  
  SurFearSur = imread('16Sur.10Fear.13Sur.png');
  [yPixel, xPixel, Color] = size(SurFearSur);
  %imdata2 = imresize(imdata2, [25 75]);

  SurSurFear = imread('16Sur.13Sur.10Fear.png');
  [yPixel, xPixel, Color] = size(SurSurFear);
  %imdata3 = imresize(imdata3, [25 75]);
   
  SurConSur = imread('16Sur.10Con.13Sur.png');
  [yPixel, xPixel, Color] = size(SurConSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SurSurCon = imread('16Sur.13Sur.10Con.png');
  [yPixel, xPixel, Color] = size(SurSurCon);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SurAngSur = imread('16Sur.10Ang.13Sur.png');
  [yPixel, xPixel, Color] = size(SurAngSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SmaiSurSmai = imread('16Smai.10Sur.13Smai.png');
  [yPixel, xPixel, Color] = size(SmaiSurSmai);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SmaiSmaiSur = imread('16Smai.13Smai.10Sur.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiSur);
  
  SmaiSmaiSur = imread('16Smai.10Fear.13Smai.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiSur );
  
  SmaiSmaiFear = imread('16Smai.13Smai.10Fear.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiFear);
  %imdata1 = imresize(imdata1, [25 75]);
  
  SmaiConSmai = imread('16Smai.10Con.13Smai.png');
  [yPixel, xPixel, Color] = size(SmaiConSmai);
  %imdata2 = imresize(imdata2, [25 75]);

  SmaiSmaiCon = imread('16Smai.13Smai.10Con.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiCon);
  %imdata3 = imresize(imdata3, [25 75]);
   
  SmaiAngSmai = imread('16Smai.10Ang.13Smai.png');
  [yPixel, xPixel, Color] = size(SmaiAngSmai);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SmaiSmaiAng = imread('16Smai.13Smai.10Ang.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearSurFear = imread('16Fear.10Sur.13Fear.png');
  [yPixel, xPixel, Color] = size(FearSurFear);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearFearSur = imread('16Fear.13Fear.10Sur.png');
  [yPixel, xPixel, Color] = size(FearFearSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearSmaiFear = imread('16Fear.10Smai.13Fear.png');
  [yPixel, xPixel, Color] = size(FearSmaiFear);
  
  FearFearSmai = imread('16Fear.13Fear.10Smai.png');
  [yPixel, xPixel, Color] = size(FearFearSmai);
  
  FearConFear = imread('16Fear.10Con.13Fear.png');
  [yPixel, xPixel, Color] = size(FearConFear);
  %imdata1 = imresize(imdata1, [25 75]);
  
  FearFearCon = imread('16Fear.13Fear.10Con.png');
  [yPixel, xPixel, Color] = size(FearFearCon);
  %imdata2 = imresize(imdata2, [25 75]);

  FearAngFear = imread('16Fear.10Ang.13Fear.png');
  [yPixel, xPixel, Color] = size(FearAngFear);
  %imdata3 = imresize(imdata3, [25 75]);
   
  FearFearAng = imread('16Fear.13Fear.10Ang.png');
  [yPixel, xPixel, Color] = size(FearFearAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  ConSurCon = imread('16Con.10Sur.13Con.png');
  [yPixel, xPixel, Color] = size(ConSurCon);
  %imdata4 = imresize(imdata4, [25 75]);
  
  ConConSur = imread('16Con.13Con.10Sur.png');
  [yPixel, xPixel, Color] = size(ConConSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearFearSur = imread('16Fear.13Fear.10Sur.png');
  [yPixel, xPixel, Color] = size(FearFearSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  ConSmaiCon = imread('16Con.10Smai.13Con.png');
  [yPixel, xPixel, Color] = size(ConSmaiCon);
  
  ConConSmai = imread('16Con.13Con.10Smai.png');
  [yPixel, xPixel, Color] = size(ConConSmai);
  
  ConFearCon = imread('16Con.10Fear.13Con.png');
  [yPixel, xPixel, Color] = size(ConFearCon);
  %imdata1 = imresize(imdata1, [25 75]);
  
  ConConFear = imread('16Con.13Con.10Fear.png');
  [yPixel, xPixel, Color] = size(ConConFear);
  %imdata2 = imresize(imdata2, [25 75]);

  ConAngCon = imread('16Con.10Ang.13Con.png');
  [yPixel, xPixel, Color] = size(ConAngCon);
  %imdata3 = imresize(imdata3, [25 75]);
   
  ConConAng = imread('16Con.13Con.10Ang.png');
  [yPixel, xPixel, Color] = size(ConConAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngSurAng = imread('16Ang.10Sur.13Ang.png');
  [yPixel, xPixel, Color] = size(AngSurAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngAngSur = imread('16Ang.13Ang.10Sur.png');
  [yPixel, xPixel, Color] = size(AngAngSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngSmaiAng = imread('16Ang.10Smai.13Ang.png');
  [yPixel, xPixel, Color] = size(AngSmaiAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngAngSmai = imread('16Ang.13Ang.10Smai.png');
  [yPixel, xPixel, Color] = size(AngAngSmai);
  
  AngFearAng = imread('16Ang.10Fear.13Ang.png');
  [yPixel, xPixel, Color] = size(AngFearAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngAngFear = imread('16Ang.13Ang.10Fear.png');
  [yPixel, xPixel, Color] = size(AngAngFear);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngConAng = imread('16Ang.10Con.13Ang.png');
  [yPixel, xPixel, Color] = size(AngConAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  AngAngCon = imread('16Ang.13Ang.10Con.png');
  [yPixel, xPixel, Color] = size(AngAngCon);
  
  AngAngNe = imread('AngAngNe.png');
  [yPixel, xPixel, Color] = size(AngAngNe);
  %imdata3 = imresize(imdata3, [25 75]);
   
  AngNeAng = imread('AngNeAng.png');
  [yPixel, xPixel, Color] = size(AngNeAng);
  %imdata4 = imresize(imdata4, [25 75]);
  
  ConConNe = imread('ConConNe.png');
  [yPixel, xPixel, Color] = size(ConConNe);
  %imdata4 = imresize(imdata4, [25 75]);
  
  ConNeCon = imread('ConNeCon.png');
  [yPixel, xPixel, Color] = size(ConNeCon);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearFearNe = imread('FearFearNe.png');
  [yPixel, xPixel, Color] = size(FearFearNe);
  %imdata4 = imresize(imdata4, [25 75]);
  
  FearNeFear = imread('FearNeFear.png');
  [yPixel, xPixel, Color] = size(FearNeFear);
  
  SmaiNeSmai = imread('SmaiSmaiNe.png');
  [yPixel, xPixel, Color] = size(SmaiNeSmai);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SmaiSmaiNe = imread('SmaiNeSmai.png');
  [yPixel, xPixel, Color] = size(SmaiSmaiNe);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SurNeSur = imread('SurNeSur.png');
  [yPixel, xPixel, Color] = size(SurNeSur);
  %imdata4 = imresize(imdata4, [25 75]);
  
  SurSurNe = imread('SurSurNe.png');
  [yPixel, xPixel, Color] = size(SurSurNe);
  
  SurSmaiSur = Screen('MakeTexture', win, SurSmaiSur);
  SurSurSmai = Screen('MakeTexture', win, SurSurSmai);
  SurFearSur = Screen('MakeTexture', win, SurFearSur);
  SurSurFear = Screen('MakeTexture', win, SurSurFear);
  SurConSur = Screen('MakeTexture', win, SurConSur);
  SurSurCon = Screen('MakeTexture', win, SurSurCon);
  SurAngSur = Screen('MakeTexture', win, SurAngSur);
  SmaiSurSmai = Screen('MakeTexture', win, SmaiSurSmai);
  SmaiSmaiSur = Screen('MakeTexture', win,  SmaiSmaiSur);
  SmaiSmaiFear = Screen('MakeTexture', win, SmaiSmaiFear);
  SmaiConSmai = Screen('MakeTexture', win, SmaiConSmai);
  SmaiSmaiCon = Screen('MakeTexture', win, SmaiSmaiCon);
  SmaiAngSmai = Screen('MakeTexture', win, SmaiAngSmai);
  SmaiSmaiAng = Screen('MakeTexture', win, SmaiSmaiAng);
  FearSurFear = Screen('MakeTexture', win, FearSurFear);
  FearFearSur = Screen('MakeTexture', win, FearFearSur);
  FearSmaiFear = Screen('MakeTexture', win, FearSmaiFear);
  FearFearSmai = Screen('MakeTexture', win, FearFearSmai);
  FearConFear = Screen('MakeTexture', win, FearConFear);
  FearFearCon = Screen('MakeTexture', win, FearFearCon);
  FearAngFear = Screen('MakeTexture', win, FearAngFear);
  FearFearAng = Screen('MakeTexture', win, FearFearAng);
  ConSurCon = Screen('MakeTexture', win, ConSurCon);
  ConConSur = Screen('MakeTexture', win, ConConSur);
  FearFearSur = Screen('MakeTexture', win, FearFearSur);
  ConSmaiCon = Screen('MakeTexture', win, ConSmaiCon);
  ConConSmai = Screen('MakeTexture', win, ConConSmai);
  ConFearCon = Screen('MakeTexture', win, ConFearCon);
  ConConFear  = Screen('MakeTexture', win, ConConFear);
  ConAngCon = Screen('MakeTexture', win, ConAngCon);
  ConConAng = Screen('MakeTexture', win, ConConAng);
  AngAngSur = Screen('MakeTexture', win, AngAngSur);
  AngSmaiAng = Screen('MakeTexture', win, AngSmaiAng);
  AngAngSmai = Screen('MakeTexture', win, AngAngSmai);
  AngFearAng = Screen('MakeTexture', win, AngFearAng);
  AngAngFear = Screen('MakeTexture', win, AngAngFear);
  AngConAng = Screen('MakeTexture', win, AngFearAng);
  AngAngCon = Screen('MakeTexture', win, AngAngCon);
  AngAngNe = Screen('MakeTexture', win, AngAngNe);
  AngNeAng = Screen('MakeTexture', win, AngNeAng);
  ConConNe = Screen('MakeTexture', win, ConConNe);
  ConNeCon = Screen('MakeTexture', win, ConNeCon);
  FearFearNe = Screen('MakeTexture', win, FearFearNe);
  FearNeFear = Screen('MakeTexture', win, FearNeFear);
  SmaiNeSmai = Screen('MakeTexture', win, SmaiNeSmai);
  SmaiSmaiNe = Screen('MakeTexture', win, SmaiSmaiNe);
  SurNeSur = Screen('MakeTexture', win, SurNeSur);
  SurSurNe = Screen('MakeTexture', win, SurSurNe);
  
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

%%%%%%%%%%
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

%%%%%%%%%%

  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(5);
%%%%%%%%%%%%%%%%%%%%%%%%
 %練習試行   
 %#第一ブロック
  
  b=zeros(1,112);
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
b(1, 81:82) = 41;
b(1, 83:84) = 42;
b(1, 85:86) = 43;
b(1, 87:88) = 44;
b(1, 89:90) = 45;
b(1, 91:92) = 46;
b(1, 93:94) = 47;
b(1, 95:96) = 48;
b(1, 97:98) = 49;
b(1, 99:100) = 50;
b(1, 101:102) = 51;
b(1, 103:104) = 52;
b(1, 105:106) = 53;
b(1, 107:108) = 54;
b(1, 109:110) = 55;
b(1, 111:112) = 56;
  
for i = 1:112
    a=b (r(i))

    Screen('FillRect',win,white);
    %distract = '';
    
   if a == 1
     Screen('DrawTexture', win, SurSmaiSur,[],rect);
     %Screen('FillRect', win, im1, [], rect);
     distract='SurSmaiSur'
   elseif a == 2
     Screen('DrawTexture', win, SurSurSmai,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SurSurSmai'
   elseif a == 3
     Screen('DrawTexture', win, SurFearSur,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SurFearSur'
   elseif a == 4
     Screen('DrawTexture', win, SurSurFear,[],rect);
     %Screen('FillRect', win, im3, [], rect);
     distract='SurSurFear'
   elseif a == 5
     Screen('DrawTexture', win, SurConSur,[],rect);
     %Screen('FillRect', win, im4, [], rect);
     distract='SurConSur'
   elseif a == 6
     Screen('DrawTexture', win, SurSurCon,[],rect); 
     %Screen('FillRect', win, im4, [], rect);
     distract='SurSurCon' 
   elseif a == 7
     Screen('DrawTexture', win, SurAngSur,[],rect);
     %Screen('FillRect', win, im1, [], rect);
     distract='SurAngSur'
   elseif a == 8
     Screen('DrawTexture', win, SmaiSurSmai,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SmaiSurSmai'
   elseif a == 9
     Screen('DrawTexture', win, SmaiSmaiSur,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SmaiSmaiSur'
   elseif a == 10
     Screen('DrawTexture', win, SmaiSmaiFear,[],rect);
     %Screen('FillRect', win, im1, [], rect);
     distract='SurSmaiSur'
   elseif a == 12
     Screen('DrawTexture', win, SmaiConSmai,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SurSurSmai'
   elseif a == 13
     Screen('DrawTexture', win, SmaiSmaiCon,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SurFearSur'
   elseif a == 14
     Screen('DrawTexture', win, SmaiAngSmai ,[],rect);
     %Screen('FillRect', win, im3, [], rect);
     distract='SurSurFear'
   elseif a == 15
     Screen('DrawTexture', win, SmaiSmaiAng,[],rect);
     %Screen('FillRect', win, im4, [], rect);
     distract='SurConSur'
   elseif a == 16
     Screen('DrawTexture', win, FearSurFear,[],rect);  
     %Screen('FillRect', win, im4, [], rect);
     distract='FearSurFear'  
   elseif a == 17
     Screen('DrawTexture', win, SurAngSur,[],rect);   
     %Screen('FillRect', win, im1, [], rect);
     distract='SurAngSur'
   elseif a == 18
     Screen('DrawTexture', win, SmaiSurSmai,[],rect);
     %Screen('FillRect', win, im2, [], rect);
     distract='SmaiSurSmai'
   elseif a == 19
     Screen('DrawTexture', win, SmaiSmaiFear,[],rect);
     distract='SmaiSmaiSur'
     
   elseif a == 20 
    Screen('DrawTexture', win, SmaiConSmai, [], rect); 
    distract = 'SmaiConSmai'

   elseif a == 21 
    Screen('DrawTexture', win, SmaiSmaiCon, [], rect); 
    distract = 'SmaiSmaiCon'

   elseif a == 22 
    Screen('DrawTexture', win, SmaiAngSmai, [], rect); 
    distract = 'SmaiAngSmai'

   elseif a == 23
    Screen('DrawTexture', win, SmaiSmaiAng, [], rect); 
    distract = 'SmaiSmaiAng'

   elseif a == 24 
    Screen('DrawTexture', win, FearSurFear, [], rect); 
    distract = 'FearSurFear'

   elseif a == 25 
    Screen('DrawTexture', win, FearFearSur, [], rect); 
    distract = 'FearFearSur'

   elseif a == 26 
    Screen('DrawTexture', win, FearSmaiFear, [], rect); 
    distract = 'FearSmaiFear'

   elseif a == 27 
    Screen('DrawTexture', win, FearFearSmai, [], rect); 
    distract = 'FearFearSmai'; 

   elseif a == 28 
    Screen('DrawTexture', win, FearConFear, [], rect); 
     distract = 'FearConFear'

   elseif a == 29 
    Screen('DrawTexture', win, FearFearCon, [], rect); 
    distract = 'FearFearCon'

   elseif a == 30 
    Screen('DrawTexture', win, FearAngFear, [], rect); 
    distract = 'FearAngFear'

   elseif a == 31 
    Screen('DrawTexture', win, FearFearAng, [], rect); 
    distract = 'FearFearAng'

   elseif a == 32 
    Screen('DrawTexture', win, ConSurCon, [], rect); 
    distract = 'ConSurCon'

   elseif a == 33 
    Screen('DrawTexture', win, ConConSur, [], rect); 
    distract = 'ConConSur'; 

   elseif a == 34 
    Screen('DrawTexture', win, ConSmaiCon, [], rect); 
    distract = 'ConSmaiCon'

   elseif a == 35 
    Screen('DrawTexture', win, ConConSmai, [], rect); 
    distract = 'ConConSmai'

   elseif a == 36 
    Screen('DrawTexture', win, ConFearCon, [], rect); 
    distract = 'ConFearCon'

   elseif a == 37 
    Screen('DrawTexture', win, ConConFear, [], rect); 
    distract = 'ConConFear'

   elseif a == 38 
    Screen('DrawTexture', win, ConAngCon, [], rect); 
    distract = 'ConAngCon'

   elseif a == 39 
    Screen('DrawTexture', win, ConConAng, [], rect); 
    distract = 'ConConAng'
  
   elseif a == 40 
    Screen('DrawTexture', win, AngAngSur, [], rect); 
    distract = 'AngAngSur'

   elseif a == 41 
    Screen('DrawTexture', win, AngSmaiAng, [], rect); 
    distract = 'AngSmaiAng'

   elseif a == 42 
    Screen('DrawTexture', win, AngAngSmai, [], rect); 
    distract = 'AngAngSmai'

  elseif a == 43 
    Screen('DrawTexture', win, AngFearAng, [], rect); 
    distract = 'AngFearAng'

  elseif a == 44 
    Screen('DrawTexture', win, AngAngFear, [], rect); 
    distract = 'AngAngFear'

  elseif a == 45 
    Screen('DrawTexture', win, AngConAng, [], rect); 
    distract = 'AngConAng'

  elseif a == 46 
    Screen('DrawTexture', win, AngAngCon, [], rect); 
    distract = 'AngAngCon'

  elseif a == 47 
    Screen('DrawTexture', win, ConConFear, [], rect); 
    distract = 'AngAngNe'

  elseif a == 48 
    Screen('DrawTexture', win, ConAngCon, [], rect); 
    distract = 'AngNeAng'

  elseif a == 49 
    Screen('DrawTexture', win, ConConAng, [], rect); 
    distract = 'ConConNe'

  elseif a == 50 
    Screen('DrawTexture', win, AngAngSur, [], rect); 
    distract = 'AngAngSur'

  elseif a == 51  
    Screen('DrawTexture', win, AngSmaiAng, [], rect); 
    distract = 'AngSmaiAng'

  elseif a == 52 
    Screen('DrawTexture', win, AngAngSmai, [], rect); 
    distract = 'AngAngSmai'

  elseif a == 53 
    Screen('DrawTexture', win, AngFearAng, [], rect); 
    distract = 'AngFearAng'

  elseif a == 54 
    Screen('DrawTexture', win, AngAngFear, [], rect); 
    distract = 'AngAngFear'

  elseif a == 55 
    Screen('DrawTexture', win, AngConAng, [], rect); 
    distract = 'AngConAng'

  elseif a == 56 
    Screen('DrawTexture', win, AngAngCon, [], rect); 
    distract = 'AngAngCon'
   
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
    elseif keycode(KbName('F')) && a == 41
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 41
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 42
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 42
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 43
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 43
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 44
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 44
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 45
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 45
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 46
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 46
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
    break;
    elseif keycode(KbName('F')) && a == 47
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 47
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 48
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 48
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 49
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 49
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 50
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 50
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;      
    elseif keycode(KbName('F')) && a == 51
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 51
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;  
    elseif keycode(KbName('F')) && a == 52
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 52
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;     
    elseif keycode(KbName('F')) && a == 53
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 53
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('F')) && a == 54
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 54
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break; 
    elseif keycode(KbName('F')) && a == 55
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 55
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;     
    elseif keycode(KbName('F')) && a == 56
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
    elseif keycode(KbName('J')) && a == 56
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
   end%%ifのend
  end%%whileのend
   
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

