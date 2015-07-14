package com.jeizas.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.jeizas.entity.ThreeMan;

public interface ThreeManService {
	
	JSONObject getThreeManPageList(int index,int pagesize);
	List<ThreeMan> getThreeManList();
	void updateThreeMan(ThreeMan threeMan);
	void deleteThreeMan(ThreeMan threeMan);
	void saveThreeMan(ThreeMan threeMan);
}
