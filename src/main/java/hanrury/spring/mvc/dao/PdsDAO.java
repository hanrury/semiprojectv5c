package hanrury.spring.mvc.dao;

import hanrury.spring.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository("pdao")
public class PdsDAO {

    private JdbcTemplate jdbcTemplate;

    @Value("#{jdbc['insertPdsSQL']}") private String insertPdsSQL;
    @Value("#{jdbc['selectPdsSQL']}") private String selectPdsSQL;
    @Value("#{jdbc['selectOnePdsSQL']}") private String selectOnePdsSQL;
    @Value("#{jdbc['updateViewSQL']}") private String updateViewSQL;
    @Value("#{jdbc['updateDownSQL']}") private String updateDownSQL;

    public PdsDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean insertPds(PdsVO p) {
        Object[] params = new Object[] {
                p.getTitle(), p.getUserid(), p.getContents(),
                p.getFname(),
                p.getFsize(),
                p.getFdown(),
                p.getFtype()
        };

        boolean isInsert = false;
        if (jdbcTemplate.update(insertPdsSQL, params) > 0)
            isInsert = true;

        return isInsert;
    }

    public List<PdsVO> selectPds() {
        RowMapper<PdsVO> mapper = new PdsDAO.PdsRowMapper();
        return jdbcTemplate.query(selectPdsSQL, mapper);
    }

    // 글번호 본문글 조회
    public PdsVO selectOnePds(String pno) {
        Object[] params = new Object[] { pno };

        RowMapper<PdsVO> mapper = new PdsDAO.PdsOneMapper();

        PdsVO pvo =jdbcTemplate.queryForObject(selectOnePdsSQL,mapper,params);

        return pvo;
    }

    // 글번호로 본문글에 대한 조회수 증가
    public void updateViewPds(String pno) {
        Object[] params = new Object[] {pno};

        jdbcTemplate.update(updateViewSQL, params);
    }

    // 글번호로 첨부파일에 대한 다운로드수 증가
    public void updateDownPds(String pno) {
        Object[] params = new Object[] {pno};

        jdbcTemplate.update(updateDownSQL, params);
    }

    private class PdsRowMapper implements RowMapper<PdsVO> {
        @Override
        public PdsVO mapRow(ResultSet rs, int num) throws SQLException {
            PdsVO pvo = new PdsVO(
              rs.getString("pno"),
              rs.getString("title"),
              rs.getString("userid"),
              rs.getString("regdate"),
              rs.getString("thumbup"),
              rs.getString("views"),
                    null,
                    null,
                    null,
                    null,
                    null
            );
            return pvo;
        }
    }

    private class PdsOneMapper implements RowMapper<PdsVO> {
        @Override
        public PdsVO mapRow(ResultSet rs, int num) throws SQLException {
            PdsVO pvo = new PdsVO(
                    rs.getString("pno"),
                    rs.getString("title"),
                    rs.getString("userid"),
                    rs.getString("regdate"),
                    rs.getString("thumbup"),
                    rs.getString("views"),
                    rs.getString("contents"),
                    rs.getString("fname"),
                    rs.getString("fsize"),
                    rs.getString("fdown"),
                    rs.getString("ftype")
            );
            return pvo;
        }
    }
}
