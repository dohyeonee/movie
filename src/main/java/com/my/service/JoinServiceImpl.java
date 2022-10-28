package com.my.service;

import com.my.dao.JoinDAOImpl;
import com.my.dto.JoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {
    private JoinDAOImpl dao;

    @Autowired
    public JoinServiceImpl(JoinDAOImpl dao) {
        this.dao = dao;
    }

    @Override
    public JoinDTO login(JoinDTO dto) throws Exception {
        return dao.login(dto);
    }

    @Override
    public int join(JoinDTO dto) throws Exception {
        return dao.join(dto);
    }
}
