package com.project.fd.owner.reviewcomment.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerReivewCommentDAOMybatis implements OwnerReivewCommentDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="";
	
}