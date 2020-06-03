package hanrury.spring.mvc.controller;

import hanrury.spring.mvc.service.FileUpDownUtil;
import hanrury.spring.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hanrury.spring.mvc.service.PdsService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Map;


@Controller
public class PdsController {

    private PdsService psrv;

    @Autowired
    public PdsController(PdsService psrv) {
        this.psrv = psrv;
    }

    // 목록보기
    @RequestMapping(value = "/pds/list")
    public ModelAndView list() {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("layout/layout"); // 뷰이름 지정
        mv.addObject("action", "../pds/list.jsp");

        // 목록 불러오기
        ArrayList<PdsVO> plist = psrv.showPds();
        mv.addObject("plist", plist);

        return mv;
    }

    // 새글쓰기
    @RequestMapping(value = "/pds/write")
    public ModelAndView write() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("layout/layout"); // 뷰이름 지정

        mv.addObject("action", "../pds/write.jsp");

        return mv;
    }

    // 새글쓰기
    @RequestMapping(value = "/pds/write", method = RequestMethod.POST)
    public String writeok(PdsVO p, HttpServletRequest req) {

        // 업로드 처리
        FileUpDownUtil util = new FileUpDownUtil();
        Map<String,String> frmdata = util.procUpload(req);

        //서비스 객체로 넘김
        psrv.newPds(p,frmdata);

        return "redirect:/pds/list";
    }

    // 본문보기
    @RequestMapping(value = "/pds/view")
    public ModelAndView view(String pno) {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("layout/layout"); // 뷰이름 지정
        mv.addObject("action", "../pds/view.jsp");

        /*testing*/
        mv.addObject("action", "../yboard/list.jsp");
        /*testing ends*/

        PdsVO p = psrv.showOnePds(pno);
        mv.addObject("p", p);

        return mv;
    }

    // 수정하기
    @RequestMapping(value = "/pds/update")
    public ModelAndView update() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("layout/layout"); // 뷰이름 지정

        mv.addObject("action", "../pds/modify.jsp");

        return mv;
    }

    // 삭제하기
    @RequestMapping(value = "/pds/delete")
    public String delete() {

        return "redirect:/pds/list";
    }

    // 첨부파일 다운로드하기
    // 컨트롤러 메소드에 @ResponseBody 어노테이션을 사용하면 view를 이용해서 데이터를 출력하지 않고
    // http 응답으로 직접 데이터를 전송하겠다는 의미
    @ResponseBody
    @RequestMapping(value = "/pds/pdown")
    public void pdown(HttpServletRequest req, HttpServletResponse res) {

        FileUpDownUtil util = new FileUpDownUtil();
        try {
            String pno = req.getParameter("pno");
            psrv.modifyDown(pno); // 첨부파일 다운로드 수 증가
            util.procDownload(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//
//    // yboard 에 사진으로 출력하기 위해 테스트진행 - 사진 목록 보기
//    @RequestMapping(value = "/yboard/list")
//    public ModelAndView ylist() {
//
//        ModelAndView mv = new ModelAndView();
//
//        mv.setViewName("layout/layout"); // 뷰이름 지정
//        mv.addObject("action", "../yboard/list.jsp");
//
//        // 목록 불러오기
//        ArrayList<PdsVO> ylist = psrv.showPds();
//        mv.addObject("ylist", ylist);
//
//        return mv;
//    }
}
