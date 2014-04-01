<?php

/**
 * Filtro aplicado por los Grids de EXT JS
 *
 * @author Antonio
 */
class Tonyprr_Doctrine_Extjs__Filter {
    
    public function  __construct() {
        
    }

    public function preparedFilter($filter){
        $where = " 0 = 0 ";$qs="";
        if (is_array($filter)) {
            for ($i=0;$i<count($filter);$i++){
                switch($filter[$i]['data']['type']){
                    case 'string' : $qs .= " AND ".$filter[$i]['field']." LIKE '%".$filter[$i]['data']['value']."%'"; Break;
                    case 'list' :
                        if (strstr($filter[$i]['data']['value'],',')){
                            $fi = explode(',',$filter[$i]['data']['value']);
                            for ($q=0;$q<count($fi);$q++){
                                $fi[$q] = "'".$fi[$q]."'";
                            }
                            $filter[$i]['data']['value'] = implode(',',$fi);
                            $qs .= " AND ".$filter[$i]['field']." IN (".$filter[$i]['data']['value'].")";
                        }else{
                            $qs .= " AND ".$filter[$i]['field']." = '".$filter[$i]['data']['value']."'";
                        }
                    Break;
                    case 'boolean' : $qs .= " AND ".$filter[$i]['field']." = ".($filter[$i]['data']['value']); Break;
                    case 'numeric' :
                        switch ($filter[$i]['data']['comparison']) {
                            case 'eq' : $qs .= " AND ".$filter[$i]['field']." = ".$filter[$i]['data']['value']; Break;
                            case 'lt' : $qs .= " AND ".$filter[$i]['field']." < ".$filter[$i]['data']['value']; Break;
                            case 'gt' : $qs .= " AND ".$filter[$i]['field']." > ".$filter[$i]['data']['value']; //Break;
                        }
                    Break;
                    case 'date' :
                        switch ($filter[$i]['data']['comparison']) {
                            case 'eq' : $qs .= " AND ".$filter[$i]['field']." = '".date('Y-m-d',strtotime($filter[$i]['data']['value']))."'"; Break;
                            case 'lt' : $qs .= " AND ".$filter[$i]['field']." < '".date('Y-m-d',strtotime($filter[$i]['data']['value']))."'"; Break;
                            case 'gt' : $qs .= " AND ".$filter[$i]['field']." > '".date('Y-m-d',strtotime($filter[$i]['data']['value']))."'"; //Break;
                        }
        //			Break;
                }
            }
            $where .= $qs;
            return $where;
        }
        else{
            return "";
        }
    }
}
?>
