package hanrury.spring.mvc.service;

import hanrury.spring.mvc.dao.BoardDAO;
import hanrury.spring.mvc.dao.YBoardDAO;
import hanrury.spring.mvc.vo.BoardVO;
import hanrury.spring.mvc.vo.YBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("ybsrv")
public class YBoardService {

    private YBoardDAO ybdao;

    @Autowired
    public YBoardService(YBoardDAO ybdao) {
        this.ybdao = ybdao;
    }

    public String newYBoard(YBoardVO ybd) {
        String result = "데이터 입력 실패!";

        if (ybdao.insertYBoard(ybd))
            result = "데이터 입력 성공!!";

        System.out.println(result);
        // result 변수 값을 WAS 콘솔에 로그형태로 출력

        return result;
    }

    public ArrayList<YBoardVO> showYBoard() {
        return (ArrayList<YBoardVO>)ybdao.selectYBoard();
    }

    public YBoardVO showOneYBoard(String yno) {
        return ybdao.selectOneYBoard(yno);
    }

}
