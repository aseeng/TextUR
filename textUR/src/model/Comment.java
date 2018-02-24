package model;

import java.sql.Timestamp;
import java.util.Calendar;

public class Comment {

	private Long id;
	private Long line;
	private Timestamp date;
	private User user;
	private File file;
	private String text;
	
	public Comment(File file, Long line, User user, String text) {
		this.file = file;
		this.line = line;
		this.date = new Timestamp(Calendar.getInstance().getTime().getTime());
		this.user = user;
		this.text = text;
	}

	public Comment() { }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getLine() {
		return line;
	}

	public void setLine(Long line) {
		this.line = line;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
}
