%Sentence-Nu

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
Nu1 = imread('Nu1.png');
Nu2 = imread('Nu2.png');
Nu3 = imread('Nu3.png');
Nu4 = imread('Nu4.png');
Nu5 = imread('Nu5.png');
Nu6 = imread('Nu6.png');

Nu1 = Screen('MakeTexture', win, Nu1);
Nu2 = Screen('MakeTexture', win, Nu2);
Nu3 = Screen('MakeTexture', win, Nu3);
Nu4 = Screen('MakeTexture', win, Nu4);
Nu5 = Screen('MakeTexture', win, Nu5);
Nu6 = Screen('MakeTexture', win, Nu6);
  
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
  
 fid = fopen('Practice.csv', 'at');
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
%キー情報の取得
  [keyIsDoen,keyTime,keycode] = KbCheck;

%%%%%%%%%%%%%%%%
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
  
%%%%%%%%%%%%%%%%
r=random_number = 1.5 + rand() * (3.5 - 2.5);

  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  #スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu1,[],rect);
  Screen('Flip', win);
  WaitSecs(4);
  
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu2,[],rect);
  Screen('Flip', win);
  WaitSecs(4);
  
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu3,[],rect);
  Screen('Flip', win);
  WaitSecs(4);
  
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu4,[],rect);
  Screen('Flip', win);
  WaitSecs(4);
  
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  %スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu5,[],rect);
  Screen('Flip', win);
  WaitSecs(4);
  
  %注視点提示
  %線分を描画（太さ2ピクセル，赤色）
  Screen('DrawLines', win, xy ,2, black);
  #スクリーン上への表示
  Screen('Flip', win);
  WaitSecs(r);
  
  %FaceSenの表示
  Screen('DrawTexture', win,Nu6,[],rect);
  Screen('Flip', win);     
  WaitSecs(4);
  
%%%%%%%%%%%%%%%%%%%%%%%
  WaitSecs(1);
  fprintf(fid,'%s,%f,%s\n',distract,rt,answer);
  
  %end

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

% カーソルを表示する前にウィンドウを閉じる
sca;
ListenChar(0);
% ウィンドウハンドルをクリア
win = [];