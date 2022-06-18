package tpcs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tpcs.dao.CombineMapper;
import tpcs.service.ICombineService;

import java.util.List;

@Service
public class CombineServiceImpl implements ICombineService {
    @Autowired
    CombineMapper combineMapper;

    /** 获取id */
    @Override
    public List<Integer> queryIdListByTypeIdAndDifficultyIdAndScore(Integer courseId, Integer typeId, Integer difficultyId, Double score) {
        return combineMapper.queryIdListByTypeIdAndDifficultyIdAndScore(courseId, typeId, difficultyId, score);
    }

    @Override
    public List<Integer> queryIdListByTypeIdAndDifficultyId(Integer courseId, Integer typeId, Integer difficultyId) {
        return combineMapper.queryIdListByTypeIdAndDifficultyId(courseId, typeId, difficultyId);
    }
}
