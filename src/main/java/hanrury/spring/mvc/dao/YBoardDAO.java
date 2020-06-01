package hanrury.spring.mvc.dao;

import hanrury.spring.mvc.vo.BoardVO;
import hanrury.spring.mvc.vo.YBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository("ybdao")
public class YBoardDAO {

    private JdbcTemplate jdbcTemplate;

    @Value("#{jdbc['insertYBoardSQL']}") private String insertYBoardSQL;
    @Value("#{jdbc['selectYBoardSQL']}") private String selectYBoardSQL;
    @Value("#{jdbc['selectOneYBoardSQL']}") private String selectOneYBoardSQL;

    @Autowired
    public YBoardDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 게시판 데이터를 board테이블에 저장
    public boolean insertYBoard( YBoardVO y ) {
        // sql 정의
        //String sql = "insert into board (title,userid,contents) values (?,?,?)";

        // 매개변수 정의
        Object[] params = new Object[] {
             y.getTitle(), y.getFname(), y.getFsize()
        };

        // 매개변수 타입 정의 - 생략 ^^;

        // 샐행
        boolean isInsert = false;
        if (jdbcTemplate.update(insertYBoardSQL, params) > 0)
            isInsert = true;

        return isInsert;
    }

    // 게시판데이터 중에서 글번호/제목/작성자/작성일/추천/조회만
    // 골라서 동적배열에 담아 반환함
    // 스프링에서는 RowMapper라는 클래스를 이용해서
    // select문의 결과를 처리할 수 있음
    public List<YBoardVO> selectYBoard() {
        //String sql = "select bno,title,userid,regdate,thumbup,views from board order by bno desc";

        RowMapper<YBoardVO> mapper = new BoardRowMapper();
        //query 메서드를 통해 결과값을 가져올때
        //추출된 결과들에 따라 반복적으로 적용할 매핑 클래스

        //Mapper 클래스는 콜백함수처럼 작동되는데,
        //결과집합에서 결과행이 존재할때 마다
        //Mapper 클래스의 mapRow 메서드가 호출됨

        //개발자가 작성하는 RowMapper 클래스는
        //RowMapper 인터페이스를 구현해서 생성해야함

        return jdbcTemplate.query(selectYBoardSQL, mapper);
    }

    // 글번호로 선택한 게시물에 대해 모든 컬럼을 조회해서
    // BoardVO 객체에 저장하고 반환함
    public YBoardVO selectOneYBoard(String yno) {
        //String sql = "select * from board where bno = ?";

        Object[] params = new Object[] { yno };

        RowMapper<YBoardVO> mapper = new BoardOneMapper();
        //ArrayList<BoardVO> bdlist = (ArrayList<BoardVO>)
        //       jdbcTemplate.query(sql, mapper, params);

        //return bdlist.get(0);
        YBoardVO yvo =jdbcTemplate.queryForObject(selectOneYBoardSQL,mapper,params);

        return yvo;
    }


    // selectBoard의 RowMapper 내부 클래스
    private class BoardRowMapper implements RowMapper<YBoardVO> {

        @Override
        public YBoardVO mapRow(ResultSet rs, int num) throws SQLException {

            YBoardVO yvo = new YBoardVO(
                 rs.getString("yno"),
                 rs.getString("title"),
                 rs.getString("img"),
                 rs.getString("regdate"),
                 rs.getString("views"),
                 null,
                 null,
                 null,
                 null,
                    rs.getString("userid")
            ); // fname,fsize,ftype,contents  null 해보자

            return yvo;
        }
    }

    // selectOneBoard의 RowMapper 내부 클래스
    private class BoardOneMapper implements RowMapper<YBoardVO> {
        @Override
        public YBoardVO mapRow(ResultSet rs, int num) throws SQLException {

            YBoardVO yvo = new YBoardVO(
                    rs.getString("yno"),
                    rs.getString("title"),
                    rs.getString("img"),
                    rs.getString("regdate"),
                    rs.getString("views"),
                    null,
                    null,
                    null,
                    rs.getString("contents"),
                    rs.getString("userid")
            ); // 상세보기에서 굳이 파일 이름과 크기 타입을 보여줘야 되나? 사진만 보여주면 되지않나?

            return yvo;
        }
    }
}
