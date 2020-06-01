package hanrury.spring.mvc.controller;

import hanrury.spring.mvc.service.BoardService;
import hanrury.spring.mvc.service.YBoardService;
import hanrury.spring.mvc.vo.BoardVO;
import hanrury.spring.mvc.vo.YBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class YBoardController {

    private YBoardService ybsrv;

    @Autowired
    public YBoardController(YBoardService ybsrv) {
        this.ybsrv = ybsrv;
    }

    // 목록보기
    @RequestMapping(value = "/yboard/list")
    public ModelAndView list() {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("layout/layout"); // 뷰이름 지정
        mv.addObject("action", "../yboard/list.jsp");

        // 목록 불러오기
        ArrayList<YBoardVO> ybdlist = ybsrv.showYBoard();
        mv.addObject("ybdlist", ybdlist);

        return mv;
    }

    // 새글쓰기
    @RequestMapping(value = "/yboard/write")
    public ModelAndView write() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("layout/layout"); // 뷰이름 지정

        mv.addObject("action", "../yboard/write.jsp");

        return mv;
    }

    // 새글쓰기
    @RequestMapping(value = "/yboard/write", method = RequestMethod.POST)
    public String writeok(YBoardVO ybd) {

        ybsrv.newYBoard(ybd);

        return "redirect:/yboard/list";
    }

    // 본문보기
    @RequestMapping(value = "/yboard/view")
    public ModelAndView view(String yno) {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("layout/layout"); // 뷰이름 지정
        mv.addObject("action", "../yboard/view.jsp");

        YBoardVO y = ybsrv.showOneYBoard(yno);
        mv.addObject("y", y);

        return mv;
    }

    // 수정하기
    @RequestMapping(value = "/yboard/update")
    public ModelAndView update() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("layout/layout"); // 뷰이름 지정

        mv.addObject("action", "../yboard/modify.jsp");

        return mv;
    }

    // 삭제하기
    @RequestMapping(value = "/yboard/delete")
    public String delete() {

        return "redirect:/yboard/list";
    }

}
