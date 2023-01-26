package com.my.service;

import com.my.dto.MemberDTO;
import com.my.mapper.MemberMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    private static final Logger log = Logger.getLogger(MemberServiceImpl.class);

    private MemberMapper mapper;
    @Autowired
    public MemberServiceImpl(MemberMapper mapper) {
        this.mapper = mapper;
    }

    public MemberDTO login(MemberDTO dto) {
        return mapper.login(dto);
    }

    public int join(MemberDTO dto) {
        return mapper.join(dto);
    }

    public MemberDTO idChk(MemberDTO dto) {
        return mapper.idChk(dto);
    }

    @Override
    public MemberDTO getInfo(String id) {
        return mapper.getInfo(id);
    }

    public int changeInfo(MemberDTO dto) {
        return mapper.changeInfo(dto);
    }
}
