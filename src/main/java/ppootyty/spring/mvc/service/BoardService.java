package ppootyty.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ppootyty.spring.mvc.dao.BoardDAO;
import ppootyty.spring.mvc.vo.BoardVO;

import java.util.ArrayList;

@Service("bsrv")
public class BoardService {

    private BoardDAO bdao;

    @Autowired
    public BoardService(BoardDAO bdao) {
        this.bdao = bdao;
    }

    public String newBoard(BoardVO bd) {
        String result = "데이터 입력 실패!";

        if (bdao.insertBoard(bd))
            result = "데이터 입력 성공!!";

        System.out.println(result);
        // result 변수 값을 WAS 콘솔에 로그형태로 출력

        return result;
    }

    public ArrayList<BoardVO> showBoard() {
        return (ArrayList<BoardVO>)bdao.selectBoard();
    }

    public BoardVO showOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

}