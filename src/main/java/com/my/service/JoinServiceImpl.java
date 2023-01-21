package com.my.service;

import com.my.dto.JoinDTO;
import com.my.mapper.JoinMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {
    private static final Logger log = Logger.getLogger(JoinServiceImpl.class);

    private JoinMapper mapper;
    @Autowired
    public JoinServiceImpl(JoinMapper mapper) {
        this.mapper = mapper;
    }

    public JoinDTO login(JoinDTO dto) {
        return this.mapper.login(dto);
    }

    public int join(JoinDTO dto) {
        return this.mapper.join(dto);
    }

    public JoinDTO idChk(JoinDTO dto) {
        return this.mapper.idChk(dto);
    }
}
