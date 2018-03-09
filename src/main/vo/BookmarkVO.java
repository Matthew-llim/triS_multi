package main.vo;

public class BookmarkVO {
	   private String user_id;
	   private Integer space_no;

	   public BookmarkVO() {
	      // TODO Auto-generated constructor stub
	   }

	   public BookmarkVO(String user_id, Integer space_no) {
	      super();
	      this.user_id = user_id;
	      this.space_no = space_no;
	   }

	   public String getUser_id() {
	      return user_id;
	   }

	   public void setUser_id(String user_id) {
	      this.user_id = user_id;
	   }

	   public Integer getSpace_no() {
	      return space_no;
	   }

	   public void setSpace_no(Integer space_no) {
	      this.space_no = space_no;
	   }

	}
