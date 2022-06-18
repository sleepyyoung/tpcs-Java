package tpcs.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CombineMapper {
    /** 获取id */
    List<Integer> queryIdListByTypeIdAndDifficultyIdAndScore(Integer courseId, Integer typeId, Integer difficultyId, Double score);

    List<Integer> queryIdListByTypeIdAndDifficultyId(Integer courseId, Integer typeId, Integer difficultyId);
}
