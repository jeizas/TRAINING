package com.jeizas.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeizas.dao.BaseDao;
import com.jeizas.entity.DomainValue;
import com.jeizas.entity.ThreeMan;
import com.jeizas.service.DomainValueService;
@Service("domainValueService")
public class DomainValueServiceImpl implements DomainValueService {

	@Resource
	private BaseDao<DomainValue> domainDao;
	
	@Override
	public List<DomainValue> getDomainValueList() {
		// TODO Auto-generated method stub
		return domainDao.find(" from DomainValue ");
	}

}
