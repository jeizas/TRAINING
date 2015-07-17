package com.jeizas.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.scripting.config.LangNamespaceHandler;
import org.springframework.stereotype.Service;

import com.jeizas.dao.BaseDao;
import com.jeizas.entity.DomainValue;
import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;

@Service("threeManService")
public class ThreeManServiceImpl implements ThreeManService {
	
	@Resource
	private BaseDao<ThreeMan> threeManDao;

	@Override
	public List<ThreeMan> getThreeManList() {
		// TODO Auto-generated method stub
		return threeManDao.find(" from ThreeMan t order by t.id ");
	}

	@Override
	public void updateThreeMan(ThreeMan threeMan) {
		// TODO Auto-generated method stub
		threeManDao.update(threeMan);
	}

	@Override
	public JSONObject getThreeManPageList(int page, int rows) {
		// TODO Auto-generated method stub
		String hql = "from ThreeMan t order by t.id ";
		Long count = threeManDao.count("select count(*) from ThreeMan t order by t.id ");
		List<Object> param = new ArrayList<>();
		List<ThreeMan> list = threeManDao.find(hql, param, page, rows);
		JSONObject js = new JSONObject();
		js.put("total",count.intValue());
		js.put("rows", list);
		return js;
	}

	@Override
	public void deleteThreeMan(ThreeMan threeMan) {
		// TODO Auto-generated method stub
		threeManDao.delete(threeMan);
	}

	@Override
	public void saveThreeMan(ThreeMan threeMan) {
		// TODO Auto-generated method stub
		threeManDao.save(threeMan);
	}

}
