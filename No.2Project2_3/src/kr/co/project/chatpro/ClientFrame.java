package kr.co.project.chatpro;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.Socket;
import java.sql.ResultSet;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.text.DefaultCaret;

public class ClientFrame extends JFrame implements ActionListener, KeyListener {
	public boolean hjgame = false;
	public int hjwin = 0;
	JPanel jp = new JPanel();
	JTextArea textA;
	JTextField textF = new JTextField(15);
	JScrollPane scroll;
	JButton sendBtn = new JButton("전송");
	JButton exitBtn = new JButton("닫기");
	Socket socket;
	WriteThread wt;
	String msg;
	String name;

	public ClientFrame(Socket socket, String name) {
		super("채팅을 하자!");
		this.socket = socket;
		this.name = name;
		wt = new WriteThread(this, name);
		
		textA = new JTextArea();
		textA.setEditable(false);
		DefaultCaret caret = (DefaultCaret) textA.getCaret();
		caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
		scroll = new JScrollPane(textA);
		try {
			wt.sendMsg(name + "님이 입장하셨습니다");
			textA.append("\t*********채팅방 알림*********\n\n");
			
			textA.append("홀짝게임을 하시려면 /홀짝 을 입력해주세요\n주사위를 굴리시려면 /주사위 를 입력해주세요\n\n");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		add("Center", scroll);
		jp.add(textF);
		jp.add(sendBtn);
		jp.add(exitBtn);

		add("South", jp);

		textF.addKeyListener(this);
		sendBtn.addActionListener(this);
		exitBtn.addActionListener(this);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(700, 100, 400, 800);
		setVisible(true);
		addWindowListener(new WindowAdapter() {

	         @Override
	         public void windowClosing(WindowEvent e) {
	            wt.sendMsg("+++++");
	         }
	         
	      });
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == sendBtn) { // 전송버튼 누름
			if (textF.getText().equals("")) { // 보내는 텍스트 없을때
				return;
			}
			wt.sendMsg(msg);
			textF.setText("");
			// textA.append(textF.getText()+"\n");

		} else {// 닫기버튼 누름
			wt.sendMsg("+++++");
			//System.out.println(this.toString());
			this.dispose();
		}

	}

	// 엔터 눌렀을 때
	@Override
	public void keyPressed(KeyEvent e) {
		if (e.getKeyCode() == KeyEvent.VK_ENTER) {
			
			msg = textF.getText();
			if (hjgame == true) {
				if (msg.equals("홀")) {
					Random random = new Random();
					if (random.nextInt(2) + 1 == 1) {
						textA.append("홀\n맞았습니다\n");
						wt.sendMsg("님이 홀짝에서 *홀* 로 이기셨습니다");
						textA.append("\n축하합니다\n");
						hjgame = false;
					} else {
						textA.append("짝\n틀렸습니다\n");
						wt.sendMsg("님이 홀짝에서 *홀* 로 패배하셨습니다");
						textA.append("\n다시 한번 도전하세요\n");
						hjgame = false;
					}
				} else if (textF.getText().equals("짝")) {
					Random random = new Random();
					if (random.nextInt(2) + 1 == 1) {
						textA.append("짝\n맞았습니다\n");
						wt.sendMsg(" 님이 홀짝에서 *짝* 으로 이기셨습니다");
						textA.append("\n축하합니다\n");
						hjgame = false;
					} else {
						textA.append("홀\n틀렸습니다\n");
						wt.sendMsg(" 님이 홀짝에서 *짝* 으로 패배하셨습니다");
						textA.append("\n다시 한번 도전하세요\n");
						hjgame = false;
					}
				} else if (textF.getText().equals("/취소")) {
					textA.append("홀짝 게임을 취소합니다\n");
					hjgame = false;
				}
			}else if(msg.equals("")){
				wt.sendMsg("\n");
			}else {
				wt.sendMsg(msg);
			}
			
			textF.setText("");
			textA.setCaretPosition(textA.getDocument().getLength()); // 스크롤 맨 아래
		}

	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub

	}

}
