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

.	${UTIL}/bin/devel.sh
.	${UTIL}/bin/usage.sh
.	${UTIL}/bin/check_root.sh
.	${UTIL}/bin/check_tool.sh
.	${UTIL}/bin/logging.sh
.	${UTIL}/bin/send_mail.sh
.	${UTIL}/bin/load_conf.sh
.	${UTIL}/bin/load_util_conf.sh
.	${UTIL}/bin/progress_bar.sh

GEN_PL_PRO_TOOL=gen_pl_pro
GEN_PL_PRO_VERSION=ver.1.0
GEN_PL_PRO_HOME=${UTIL_ROOT}/${GEN_PL_PRO_TOOL}/${GEN_PL_PRO_VERSION}
GEN_PL_PRO_CFG=${GEN_PL_PRO_HOME}/conf/${GEN_PL_PRO_TOOL}.cfg
GEN_PL_PRO_UTIL_CFG=${GEN_PL_PRO_HOME}/conf/${GEN_PL_PRO_TOOL}_util.cfg
GEN_PL_PRO_LOG=${GEN_PL_PRO_HOME}/log

declare -A GENPLPRO_USAGE=(
	[USAGE_TOOL]="${GEN_PL_PRO_TOOL}"
	[USAGE_ARG1]="[PN] Perl App Project name"
	[USAGE_EX_PRE]="# Generating Perl App project"
	[USAGE_EX]="${GEN_PL_PRO_TOOL} RCP"
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
#			0   - tool finished with success operation 
#			128 - missing argument(s) from cli
#			129 - failed to load tool script configuration from files
#			130 - project already exist
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# __gen_pl_pro "rtp"
#
function __gen_pl_pro() {
	local PN=$1
	if [ -n "${PN}" ]; then
		local FUNC=${FUNCNAME[0]} MSG="None" STATUS_CONF STATUS_CONF_UTIL STATUS
		MSG="Loading basic and util configuration!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		__progress_bar PB_STRUCTURE
		declare -A config_gen_pl_pro=()
		__load_conf "$GEN_PL_PRO_CFG" config_gen_pl_pro
		STATUS_CONF=$?
		declare -A config_gen_pl_pro_util=()
		__load_util_conf "$GEN_PL_PRO_UTIL_CFG" config_gen_pl_pro_util
		STATUS_CONF_UTIL=$?
		declare -A STATUS_STRUCTURE=(
			[1]=$STATUS_CONF [2]=$STATUS_CONF_UTIL
		)
		__check_status STATUS_STRUCTURE
		STATUS=$?
		if [ $STATUS -eq $NOT_SUCCESS ]; then
			MSG="Force exit!"
			__info_debug_message_end "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
			exit 129
		fi
		TOOL_LOG=${config_gen_pl_pro[LOGGING]}
		TOOL_DBG=${config_gen_pl_pro[DEBUGGING]}
		TOOL_NOTIFY=${config_gen_pl_pro[EMAILING]}
		MSG="Generating project structure [${PN}]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		if [ -d "${PN}/" ]; then
			MSG="Project structure already exist [${PN}]"
			__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
			MSG="Force exit!"
			__info_debug_message_end "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
			exit 130
		fi
		MSG="Generating directory [${PN}/]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		mkdir "${PN}/"
		MSG="Generating directory [${PN}/bin/]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		mkdir "${PN}/bin/"
		MSG="Generating file [${PN}/bin/${PN}.pl]!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		local H="#" DATE=`date` BSL="\\" PL TREE T="	"
		local PT=${config_gen_pl_pro_util[PERL_TEMPLATE]}
		local AN=${config_gen_pl_pro_util[AUTHOR_NAME]}
		local AE=${config_gen_pl_pro_util[AUTHOR_EMAIL]}
		local USER=${config_gen_pl_pro_util[USER]}
		local GROUP=${config_gen_pl_pro_util[GROUP]}
		local V=${config_gen_pl_pro_util[VERSION]}
		local PLF="${PN}/bin/${PN}.pl" PLT="${GEN_PL_PRO_HOME}/conf/${PT}"
		while read PL
		do
			eval echo "${PL}" >> ${PLF}
		done < ${PLT}
		MSG="Generating directory [${PN}/conf/]!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		mkdir "${PN}/conf/"
		MSG="Generating file [${PN}/conf/${PN}.cfg]!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		local CFG="${PN}/conf/${PN}.cfg" CL
		local CT=${config_gen_pl_pro_util[CFG_TEMPLATE]}
		local CFGT="${GEN_PL_PRO_HOME}/conf/${CT}"
		while read CL
		do
			eval echo "${CL}" >> ${CFG}
		done < ${CFGT}
		MSG="Generating file [${PN}/conf/${PN}_util.cfg]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		local CFGU="${PN}/conf/${PN}_util.cfg"
		local CTU=${config_gen_pl_pro_util[CFG_UTIL_TEMPLATE]}
		local CFGTU="${GEN_PL_PRO_HOME}/conf/${CTU}"
		while read CL
		do
			eval echo "${CL}" >> ${CFGU}
		done < ${CFGTU}
		MSG="Generating directory [${PN}/log/]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		mkdir "${PN}/log/"
		MSG="Generating file [${PN}/log/${PN}.log]"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		touch "${PN}/log/${PN}.log"
		MSG="Set owner!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		local USRID=${config_gen_pl_pro_util[UID]}
		local GRPID=${config_gen_pl_pro_util[GID]}
		eval "chown -R ${USRID}.${GRPID} ${PN}/"
		MSG="Set permission!"
		__info_debug_message "$MSG" "$FUNC" "$GEN_PL_PRO_TOOL"
		eval "chmod -R 700 ${PN}/"
		MSG="Generated project structure [${PN}]"
		GEN_PL_PRO_LOGGING[LOG_MSGE]="$MSG"
		GEN_PL_PRO_LOGGING[LOG_FLAG]="info"
		__logging GEN_PL_PRO_LOGGING
		__info_debug_message_end "Done" "$FUNC" "$GEN_PL_PRO_TOOL"
		TREE=$(which tree)
		__check_tool "${TREE}"
		STATUS=$?
		if [ $STATUS -eq $SUCCESS ]; then
			eval "${TREE} -L 3 ${PN}/"
		fi
		exit 0
	fi
	__usage GENPLPRO_USAGE
	exit 128
}

#
# @brief   Main entry point of script tool
# @param   Value required project name
# @exitval Script tool gen_pl_pro exit with integer value
#			0   - tool finished with success operation
# 			127 - run tool script as root user from cli
#			128 - missing argument(s) from cli
#			129 - failed to load tool script configuration from files
#			130 - project already exist
#
printf "\n%s\n%s\n\n" "${GEN_PL_PRO_TOOL} ${GEN_PL_PRO_VERSION}" "`date`"
__check_root
STATUS=$?
if [ $STATUS -eq $SUCCESS ]; then
	__gen_pl_pro $1
fi

exit 127

