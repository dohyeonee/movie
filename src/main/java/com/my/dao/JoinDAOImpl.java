package com.my.dao;

import com.my.dto.JoinDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAOImpl implements JoinDAO {

    private SqlSessionTemplate sqlSessionTemplate;

//    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    public JoinDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public JoinDTO login(JoinDTO dto) throws Exception {
        return sqlSessionTemplate.selectOne("memberMapper.login", dto);
    }

    @Override
    public int join(JoinDTO dto) throws Exception {
        return sqlSessionTemplate.update("memberMapper.join", dto);
    }
}
