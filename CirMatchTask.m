%CirMatchTask      

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
  [win, winRect] = PsychImaging('OpenWindow', screenNumber, white);
  
  spaceKey=KbName('space');
  escapekey = KbName('escape');
  fid = fopen('ID9_0828CI_CrM.csv', 'at');
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
  
  %キー情報の取得
  [keyIsDoen,keyTime,keycode] = KbCheck;
  
  %フォントとテキストサイズの設定
    Screen('TextSize', win, 36);
    Screen('TextFont', win, 'Arial');

  %テキストの描画位置を計算
    [textWidth, textHeight] = RectSize(Screen('TextBounds', win, text));
    screenCenterX = winRect(3) / 2;
    screenCenterY = winRect(4) / 2;
    textRect = CenterRectOnPoint([0, 0, textWidth, textHeight], screenCenterX, screenCenterY);
    
    
  %画像の読み込み
  CirMedJ = imread('CirMedJ.png');
  CirMedF = imread('CirMedF.png');
  CirTinJ = imread('CirTinJ.png');
  CirTinF = imread('CirTinF.png');
  
  CirMedJ = Screen('MakeTexture', win, CirMedJ);
  CirMedF = Screen('MakeTexture', win, CirMedF);
  CirTinJ = Screen('MakeTexture', win, CirTinJ);
  CirTinF = Screen('MakeTexture', win, CirTinF);
  
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
  
  fid = fopen('ID9_0826MA_CrM.csv', 'at');
  
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
  
  %キー情報の取得
  [keyIsDoen,keyTime,keycode] = KbCheck;
  
  %%%%
  while 1
  [keyIsDown, secs, keycode] = KbCheck;
  Screen('DrawText',win,'Please enter spacekey when you are ready.',xcenter-330,ycenter,red);
  Screen('Flip',win);
    if keycode(KbName('space'))
      break;
      elseif keycode(KbName('escape'))
      sca;
      ListenChar(0);
      error('Program terminated by user.');
    end;
  end
  
  %%%%
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(1);
  %%%%%
  
b=zeros(1,16);
b(1, 1:4) = 1;
b(1, 5:8) = 2;
b(1, 9:12) = 3;
b(1, 13:16) = 4;

r=randperm(16);

for i = 1:16
  a=b (r(i))

    Screen('FillRect',win,white);
     distract = '';
    
    if a == 1
    Screen('DrawTexture', win, CirMedF,[],rect);
    distract='CirMedF'
    elseif a == 2
    Screen('DrawTexture', win, CirMedJ,[],rect);
    distract='CirMedJ'
    elseif a == 3
    Screen('DrawTexture', win, CirTinF,[],rect);
    distract='CirTinF'
    elseif a == 4
    Screen('DrawTexture', win, CirTinJ,[],rect);
    distract='CirTinJ'
    end%%ifのend 

   Screen('Flip',win);
   start = GetSecs;
   
   while 1
    [keyIsDown,secs,keycode] = KbCheck;
    rt = 1000*(GetSecs-start);
   if keyIsDown
      if keycode(KbName('F')) && a == 1;
      answer = 'true';
      Screen('DrawLines', win, xy ,2, black);
      Screen('Flip',win);
        break;
      elseif keycode(KbName('J')) && a == 1;
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('F')) && a == 2;
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('J')) && a == 2;
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('F')) && a == 3;
        answer = 'true';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('J')) && a == 3;
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('F')) && a == 4;
        answer = 'wrong';
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
      elseif keycode(KbName('J')) && a == 4;
        answer = 'true';        
        Screen('DrawLines', win, xy, 2, black);
        Screen('Flip', win);
        break;
 
      elseif keycode(KbName('escape'))
      sca;
      ListenChar(0);

    %error('Program terminated by user.');
    break;
    end%ifのend
    end%ifのend
   end%whileのend
  
  WaitSecs(1);
  fprintf(fid,'%s,%f,%s\n',distract,rt,answer);
  
  end%forのend

   WaitSecs(1);
   
   fclose(fid);
   sca;%ScreenCloseAllの略
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

