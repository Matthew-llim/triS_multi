package main.vo;

public class EventVO {
	   
	   public Integer getEve_no() {
	      return eve_no;
	   }
	   public void setEve_no(Integer eve_no) {
	      this.eve_no = eve_no;
	   }
	   public String getEve_title() {
	      return eve_title;
	   }
	   public void setEve_title(String eve_title) {
	      this.eve_title = eve_title;
	   }
	   public String getEve_content() {
	      return eve_content;
	   }
	   public void setEve_content(String eve_content) {
	      this.eve_content = eve_content;
	   }
	   public String getThe_time() {
	      return the_time;
	   }
	   public void setThe_time(String the_time) {
	      this.the_time = the_time;
	   }
	   public String getEve_thumb_img() {
	      return eve_thumb_img;
	   }
	   public void setEve_thumb_img(String eve_thumb_img) {
	      this.eve_thumb_img = eve_thumb_img;
	   }
	   public EventVO(){}
	   public EventVO(Integer eve_no, String eve_title, String eve_content, String the_time, String eve_thumb_img) {
	      this.eve_no = eve_no;
	      this.eve_title = eve_title;
	      this.eve_content = eve_content;
	      this.the_time = the_time;
	      this.eve_thumb_img = eve_thumb_img;
	   }
	   private Integer eve_no = null;
	   private String eve_title = null;
	   private String eve_content = null;
	   private String the_time = null;
	   private String eve_thumb_img = null;
	}
