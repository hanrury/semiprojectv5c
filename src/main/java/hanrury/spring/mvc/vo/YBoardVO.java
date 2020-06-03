package hanrury.spring.mvc.vo;

import java.io.Serializable;

// 액션태그에 사용할 자바빈즈 클래스
public class YBoardVO implements Serializable {

    private String yno;
    private String title;
    private String img;
    private String regdate;
    private String views;
    private String fname;
    private String fsize;
    private String ftype;
    private String contents;
    private String userid;

    private String gdsThumbImg;

    public String getGdsThumbImg() {
        return gdsThumbImg;
    }

    public void setGdsThumbImg(String gdsThumbImg) {
        this.gdsThumbImg = gdsThumbImg;
    }

    public YBoardVO() {
    }

    public YBoardVO(String yno, String title, String img, String regdate, String views, String fname, String fsize, String ftype, String contents, String userid) {
        this.yno = yno;
        this.title = title;
        this.img = img;
        this.regdate = regdate;
        this.views = views;
        this.fname = fname;
        this.fsize = fsize;
        this.ftype = ftype;
        this.contents = contents;
        this.userid = userid;
    }

    public String getYno() {
        return yno;
    }

    public void setYno(String yno) {
        this.yno = yno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFsize() {
        return fsize;
    }

    public void setFsize(String fsize) {
        this.fsize = fsize;
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
}
