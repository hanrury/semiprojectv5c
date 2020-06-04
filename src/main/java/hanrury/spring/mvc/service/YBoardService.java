package hanrury.spring.mvc.service;

import hanrury.spring.mvc.dao.YBoardDAO;
import hanrury.spring.mvc.vo.YBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

@Service("ybsrv")
public class YBoardService {

    private YBoardDAO ybdao;

    @Autowired
    public YBoardService(YBoardDAO ybdao) {
        this.ybdao = ybdao;
    }

    public String newYBoard(YBoardVO ybd, Map<String , String> frmdata) {

        String result = "데이터 입력 실패!";

        //첨부파일 정보를 저장
        procFormdata2(ybd,frmdata);

        if (ybdao.insertYBoard(ybd))
            result = "데이터 입력 성공!!";

        System.out.println(result);
        // result 변수 값을 WAS 콘솔에 로그형태로 출력

        return result;
    }

    private void procFormdata2(YBoardVO y, Map<String, String> frmdata) {

        for (String key : frmdata.keySet()) {
            String val = frmdata.get(key);
            switch (key) {
                case "title2":
                    y.setTitle(val);
                    break;
                case "userid":
                    y.setUserid(val);
                    break;
                case "contents":
                    y.setContents(val);
                    break;

                case "file1":
                    y.setFname(val);
                    break;
                case "file1size":
                    y.setFsize(val);
                    break;
                case "file1type":
                    y.setFtype(val);
                    break;

            }
        }
    }

    public ArrayList<YBoardVO> showYBoard() {

    return (ArrayList<YBoardVO>)ybdao.selectYBoard();
    }

    public YBoardVO showOneYBoard(String yno) {
        ybdao.updateViewYds(yno);
        return ybdao.selectOneYBoard(yno);
    }


    // 총 게시물 계산
    public int countYBoard() {
        return ybdao.selectCountYBoard();
    }

    // 게시물 삭제하기
    public void removeYBoard(String yno) {
        ybdao.deleteYBoard(yno);
    }
}
