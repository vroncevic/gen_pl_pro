#!/bin/bash
#
# @brief   Generate Perl Tool Project
# @version ver.1.0
# @date    Thu Feb 07 00:46:32 2016
# @company None, free software to use 2016
# @author  Vladimir Roncevic <elektron.ronca@gmail.com>
#
UTIL_ROOT=/root/scripts
UTIL_VERSION=ver.1.0
UTIL=${UTIL_ROOT}/sh_util/${UTIL_VERSION}
UTIL_LOG=${UTIL}/log

.    ${UTIL}/bin/devel.sh
.    ${UTIL}/bin/usage.sh
.    ${UTIL}/bin/check_root.sh
.    ${UTIL}/bin/check_tool.sh
.    ${UTIL}/bin/logging.sh
.    ${UTIL}/bin/send_mail.sh
.    ${UTIL}/bin/load_conf.sh
.    ${UTIL}/bin/load_util_conf.sh
.    ${UTIL}/bin/progress_bar.sh

GEN_PL_PRO_TOOL=gen_pl_pro
GEN_PL_PRO_VERSION=ver.1.0
GEN_PL_PRO_HOME=${UTIL_ROOT}/${GEN_PL_PRO_TOOL}/${GEN_PL_PRO_VERSION}
GEN_PL_PRO_CFG=${GEN_PL_PRO_HOME}/conf/${GEN_PL_PRO_TOOL}.cfg
GEN_PL_PRO_UTIL_CFG=${GEN_PL_PRO_HOME}/conf/${GEN_PL_PRO_TOOL}_util.cfg
GEN_PL_PRO_LOG=${GEN_PL_PRO_HOME}/log

declare -A GENPLPRO_USAGE=(
    [Usage_TOOL]="${GEN_PL_PRO_TOOL}"
    [Usage_ARG1]="[PN] Perl App Project name"
    [Usage_EX_PRE]="# Generating Perl App project"
    [Usage_EX]="${GEN_PL_PRO_TOOL} RCP"
)

declare -A GEN_PL_PRO_LOGGING=(
    [LOG_TOOL]="${GEN_PL_PRO_TOOL}"
    [LOG_FLAG]="info"
    [LOG_PATH]="${GEN_PL_PRO_LOG}"
    [LOG_MSGE]="None"
)

declare -A PB_STRUCTURE=(
    [BW]=50
    [MP]=100
    [SLEEP]=0.01
)

TOOL_DBG="false"
TOOL_LOG="false"
TOOL_NOTIFY="false"

#
# @brief   Main function
# @param   Value required project name
# @retval  Function __gen_pl_pro exit with integer value
#            0   - tool finished with success operation
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#            130 - project already exist
#            131 - failed to load project set configuration from file
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# __gen_pl_pro "rtp"
#
function __gen_pl_pro {
    local PN=$1
    if [ -n "${PN}" ]; then
        local FUNC=${FUNCNAME[0]} MSG="None"
        local STATUS_CONF STATUS_CONF_UTIL STATUS
        MSG="Loading basic and util configuration!"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        progress_bar PB_STRUCTURE
        declare -A config_gen_pl_pro=()
        load_conf "$GEN_PL_PRO_CFG" config_gen_pl_pro
        STATUS_CONF=$?
        declare -A config_gen_pl_pro_util=()
        load_util_conf "$GEN_PL_PRO_UTIL_CFG" config_gen_pl_pro_util
        STATUS_CONF_UTIL=$?
        declare -A STATUS_STRUCTURE=(
            [1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
        )
        check_status STATUS_STRUCTURE
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
            exit 129
        fi
        TOOL_LOG=${config_gen_pl_pro[LOGGING]}
        TOOL_DBG=${config_gen_pl_pro[DEBUGGING]}
        TOOL_NOTIFY=${config_gen_pl_pro[EMAILING]}
        MSG="Generating project structure!"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        if [ -d "${PN}/" ]; then
            MSG="Project structure already exist [${PN}]"
            info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
            exit 130
        fi
        local PROJECT_SET=${config_gen_pl_pro_util[PROJECT_SET]} CDIR=`pwd`
        declare -A project_set=()
        load_util_conf "${GEN_PL_PRO_HOME}/conf/${PROJECT_SET}" project_set
        STATUS=$?
        if [ $STATUS -eq $NOT_SUCCESS ]; then
            MSG="Force exit!"
            info_debug_message_end "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
            exit 131
        fi
        local PDIR="${CDIR}/${PN}"
        MSG="Generating directory [${PDIR}/]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        mkdir "${PDIR}/"
        MSG="Generating directory [${PDIR}/bin/]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        mkdir "${PDIR}/bin/"
        local H="#" DATE=`date` BSL="\\" PL TREE T="    "
        local AN=${config_gen_pl_pro_util[AUTHOR_NAME]}
        local AE=${config_gen_pl_pro_util[AUTHOR_EMAIL]}
        local USERID=${config_gen_pl_pro_util[USER]}
        local GROUPID=${config_gen_pl_pro_util[GROUP]}
        local V=${config_gen_pl_pro_util[VERSION]} PT=${project_set[PL_TOOL]}
        local PLF="${PDIR}/bin/${PN}.pl"
        local PLT="${GEN_PL_PRO_HOME}/conf/${PT}"
        MSG="Generating file [${PLF}]!"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        while read PL
        do
            eval echo "${PL}" >> ${PLF}
        done < ${PLT}
        local PLET=${project_set[PL_EDIT]}
        local PLETF=$(cat "${GEN_PL_PRO_HOME}/conf/${PLET}")
        local PLEF="${PDIR}/bin/.editorconfig"
        MSG="Generating file [${PLEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        echo -e "${PLETF}" > "${PLEF}"
        MSG="Generating directory [${PDIR}/conf/]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        mkdir "${PDIR}/conf/"
        local CFGET=${project_set[CFG_EDIT]}
        local CFGETF=$(cat "${GEN_PL_PRO_HOME}/conf/${CFGET}")
        local CFGEF="${PDIR}/conf/.editorconfig"
        MSG="Generating file [${CFGEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        echo -e "${CFGETF}" > "${CFGEF}"
        local CFG="${PDIR}/conf/${PN}.cfg" CL CT=${project_set[TOOL_CFG]}
        local CFGT="${GEN_PL_PRO_HOME}/conf/${CT}"
        MSG="Generating file [${CFG}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        while read CL
        do
            eval echo "${CL}" >> ${CFG}
        done < ${CFGT}
        local CFGET=${project_set[CFG_EDIT]}
        local CFGETF=$(cat "${GEN_PL_PRO_HOME}/conf/${CFGET}")
        local CFGEF="${PDIR}/conf/.editorconfig"
        MSG="Generating file [${CFGEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        echo -e "${CFGETF}" > "${CFGEF}"
        local CFGU="${PDIR}/conf/${PN}_util.cfg"
        local CTU=${project_set[TOOL_UTIL_CFG]}
        local CFGTU="${GEN_PL_PRO_HOME}/conf/${CTU}"
        MSG="Generating file [${CFGU}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        while read CL
        do
            eval echo "${CL}" >> ${CFGU}
        done < ${CFGTU}
        MSG="Generating directory [${PDIR}/log/]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        mkdir "${PDIR}/log/"
        MSG="Generating file [${PDIR}/log/${PN}.log]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        touch "${PDIR}/log/${PN}.log"
        local LOGET=${project_set[LOG_EDIT]}
        local LOGETF=$(cat "${GEN_PL_PRO_HOME}/conf/${LOGET}")
        local LOGEF="${PDIR}/log/.editorconfig"
        MSG="Generating file [${LOGEF}]"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        echo -e "${LOGETF}" > "${LOGEF}"
        MSG="Set owner!"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        local USRID=${config_gen_pl_pro_util[USERID]}
        local GRPID=${config_gen_pl_pro_util[GROUPID]}
        eval "chown -R ${USRID}.${GRPID} ${PDIR}/"
        MSG="Set permission!"
        info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
        eval "chmod -R 700 ${PDIR}/"
        MSG="Generated project structure [${PDIR}]"
        GEN_PL_PRO_LOGGING[LOG_MSGE]="$MSG"
        GEN_PL_PRO_LOGGING[LOG_FLAG]="info"
        logging GEN_PL_PRO_LOGGING
        info_debug_message_end "Done" "$FUNC" "$GEN_PL_PRO_TOOL"
        TREE=$(which tree)
        check_tool "${TREE}"
        STATUS=$?
        if [ $STATUS -eq $SUCCESS ]; then
            eval "${TREE} -L 3 ${PDIR}/"
        fi
        exit 0
    fi
    usage GENPLPRO_USAGE
    exit 128
}

#
# @brief   Main entry point of script tool
# @param   Value required project name
# @exitval Script tool gen_pl_pro exit with integer value
#            0   - tool finished with success operation
#            127 - run tool script as root user from cli
#            128 - missing argument(s) from cli
#            129 - failed to load tool script configuration from files
#            130 - project already exist
#            131 - failed to load project set configuration from file
#
printf "\n%s\n%s\n\n" "${GEN_PL_PRO_TOOL} ${GEN_PL_PRO_VERSION}" "`date`"
check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
    __gen_pl_pro $1
fi

exit 127

