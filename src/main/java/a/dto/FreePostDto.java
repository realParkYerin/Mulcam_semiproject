package a.dto;


import java.util.Date;

public class FreePostDto {
    private int bbs_seq;         // 게시글 번호
    private String user_id;    // 작성자 ID
    private String title;       // 게시글 제목
    private String content;     // 게시글 내용
    private int readcount;      // 조회수
    private int likecount;      // 좋아요 수
    private int cmtcount;       // 댓글 수
    private Date wdate;         // 작성일
    private Date update_date;   // 수정일
    private boolean del;        // 삭제 여부

    // 생성자
    public FreePostDto() {}

    public FreePostDto(String user_id, String title, String content) {
        this.user_id = user_id;
        this.title = title;
        this.content = content;
    }

    // getter, setter
    public int getBbs_seq() {
        return bbs_seq;
    }

    public void setBbs_seq(int bbs_seq) {
        this.bbs_seq = bbs_seq;
    }

    public String getuser_id() {
        return user_id;
    }

    public void setuser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public int getLikecount() {
        return likecount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }

    public int getCmtcount() {
        return cmtcount;
    }

    public void setCmtcount(int cmtcount) {
        this.cmtcount = cmtcount;
    }

    public Date getWdate() {
        return wdate;
    }

    public void setWdate(Date wdate) {
        this.wdate = wdate;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public boolean isDel() {
        return del;
    }

    public void setDel(boolean del) {
        this.del = del;
    }

    // toString 메소드
    @Override
    public String toString() {
        return "FreePost [bbs_seq=" + bbs_seq + ", user_id=" + user_id + ", title=" + title + ", content=" + content
                + ", readcount=" + readcount + ", likecount=" + likecount + ", cmtcount=" + cmtcount + ", wdate="
                + wdate + ", update_date=" + update_date + ", del=" + del + "]";
    }
}
