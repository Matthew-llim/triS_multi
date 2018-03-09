package main.vo;

public class ReviewVO {
   private Integer review_no;
   private Integer space_no;
   private String user_id;
   private String review_title;
   private String review_content;
   private String the_time;
   private Double review_score;
   private String review_img;

   public ReviewVO() {
      // TODO Auto-generated constructor stub
   }

   public ReviewVO(Integer review_no, Integer space_no, String user_id, String review_title, String review_content,
         String the_time, Double review_score, String review_img) {
      super();
      this.review_no = review_no;
      this.space_no = space_no;
      this.user_id = user_id;
      this.review_title = review_title;
      this.review_content = review_content;
      this.the_time = the_time;
      this.review_score = review_score;
      this.review_img = review_img;
   }

   public Integer getReview_no() {
      return review_no;
   }

   public void setReview_no(Integer review_no) {
      this.review_no = review_no;
   }

   public Integer getSpace_no() {
      return space_no;
   }

   public void setSpace_no(Integer space_no) {
      this.space_no = space_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getReview_title() {
      return review_title;
   }

   public void setReview_title(String review_title) {
      this.review_title = review_title;
   }

   public String getReview_content() {
      return review_content;
   }

   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }

   public String getThe_time() {
      return the_time;
   }

   public void setThe_time(String the_time) {
      this.the_time = the_time;
   }

   public Double getReview_score() {
      return review_score;
   }

   public void setReview_score(Double review_score) {
      this.review_score = review_score;
   }

   public String getReview_img() {
      return review_img;
   }

   public void setReview_img(String review_img) {
      this.review_img = review_img;
   }

}