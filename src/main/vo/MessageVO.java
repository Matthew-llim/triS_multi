package main.vo;

public class MessageVO {
   
   public Integer getMsg_no() {
      return msg_no;
   }
   public void setMsg_no(Integer msg_no) {
      this.msg_no = msg_no;
   }
   public String getSend_user_id() {
      return send_user_id;
   }
   public void setSend_user_id(String send_user_id) {
      this.send_user_id = send_user_id;
   }
   public String getReceive_user_id() {
      return receive_user_id;
   }
   public void setReceive_user_id(String receive_user_id) {
      this.receive_user_id = receive_user_id;
   }
   public String getMsg_content() {
      return msg_content;
   }
   public void setMsg_content(String msg_content) {
      this.msg_content = msg_content;
   }
   public String getThe_time() {
      return the_time;
   }
   public void setThe_time(String the_time) {
      this.the_time = the_time;
   }
   public Integer getView_count() {
      return view_count;
   }
   public void setView_count(Integer view_count) {
      this.view_count = view_count;
   }
   
   public MessageVO(Integer msg_no, String send_user_id, String receive_user_id, String msg_content, String the_time,
         Integer view_count) {
      this.msg_no = msg_no;
      this.send_user_id = send_user_id;
      this.receive_user_id = receive_user_id;
      this.msg_content = msg_content;
      this.the_time = the_time;
      this.view_count = view_count;
   }
   
   public MessageVO() {

   }
   
   private Integer msg_no = null;
   private   String send_user_id = null;
   private String receive_user_id = null;
   private String msg_content = null;
   private String the_time = null;
   private Integer view_count = null;
   
}