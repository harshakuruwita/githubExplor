import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class GithubModel {
  GithubModel({
    required this.id,
    required this.nodeId,
    @HiveField(1) required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    @HiveField(2) required this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    @HiveField(3) required this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.forksCount,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    required this.allowForking,
    required this.isTemplate,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
  });
  @HiveField(1)
  late final int? id;
  late final String? nodeId;
  late final String? name;
  late final String? fullName;
  late final bool? private;
  late final Owner? owner;
  late final String? htmlUrl;
  late final String? description;
  late final bool? fork;
  late final String? url;
  late final String? forksUrl;
  late final String? keysUrl;
  late final String? collaboratorsUrl;
  late final String? teamsUrl;
  late final String? hooksUrl;
  late final String? issueEventsUrl;
  late final String? eventsUrl;
  late final String? assigneesUrl;
  late final String? branchesUrl;
  late final String? tagsUrl;
  late final String? blobsUrl;
  late final String? gitTagsUrl;
  late final String? gitRefsUrl;
  late final String? treesUrl;
  late final String? statusesUrl;
  late final String? languagesUrl;
  late final String? stargazersUrl;
  late final String? contributorsUrl;
  late final String? subscribersUrl;
  late final String? subscriptionUrl;
  late final String? commitsUrl;
  late final String? gitCommitsUrl;
  late final String? commentsUrl;
  late final String? issueCommentUrl;
  late final String? contentsUrl;
  late final String? compareUrl;
  late final String? mergesUrl;
  late final String? archiveUrl;
  late final String? downloadsUrl;
  late final String? issuesUrl;
  late final String? pullsUrl;
  late final String? milestonesUrl;
  late final String? notificationsUrl;
  late final String? labelsUrl;
  late final String? releasesUrl;
  late final String? deploymentsUrl;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? pushedAt;
  late final String? gitUrl;
  late final String? sshUrl;
  late final String? cloneUrl;
  late final String? svnUrl;

  late final int? size;
  late final int? stargazersCount;
  late final int? watchersCount;
  late final String? language;
  late final bool? hasIssues;
  late final bool? hasProjects;
  late final bool? hasDownloads;
  late final bool? hasWiki;
  late final bool? hasPages;
  late final int? forksCount;

  late final bool? archived;
  late final bool? disabled;
  late final int? openIssuesCount;

  late final bool? allowForking;
  late final bool? isTemplate;
  late final List<dynamic>? topics;
  late final String? visibility;
  late final int? forks;
  late final int? openIssues;
  late final int? watchers;
  late final String? defaultBranch;

  GithubModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = Owner.fromJson(json['owner']);
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    forksUrl = json['forks_url'];
    keysUrl = json['keys_url'];
    collaboratorsUrl = json['collaborators_url'];
    teamsUrl = json['teams_url'];
    hooksUrl = json['hooks_url'];
    issueEventsUrl = json['issue_events_url'];
    eventsUrl = json['events_url'];
    assigneesUrl = json['assignees_url'];
    branchesUrl = json['branches_url'];
    tagsUrl = json['tags_url'];
    blobsUrl = json['blobs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitRefsUrl = json['git_refs_url'];
    treesUrl = json['trees_url'];
    statusesUrl = json['statuses_url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    contributorsUrl = json['contributors_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    commitsUrl = json['commits_url'];
    gitCommitsUrl = json['git_commits_url'];
    commentsUrl = json['comments_url'];
    issueCommentUrl = json['issue_comment_url'];
    contentsUrl = json['contents_url'];
    compareUrl = json['compare_url'];
    mergesUrl = json['merges_url'];
    archiveUrl = json['archive_url'];
    downloadsUrl = json['downloads_url'];
    issuesUrl = json['issues_url'];
    pullsUrl = json['pulls_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    labelsUrl = json['labels_url'];
    releasesUrl = json['releases_url'];
    deploymentsUrl = json['deployments_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    gitUrl = json['git_url'];
    sshUrl = json['ssh_url'];
    cloneUrl = json['clone_url'];
    svnUrl = json['svn_url'];

    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count'];

    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];

    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
    topics = List.castFrom<dynamic, dynamic>(json['topics']);
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['name'] = name;
    _data['full_name'] = fullName;
    _data['private'] = private;

    _data['html_url'] = htmlUrl;
    _data['description'] = description;
    _data['fork'] = fork;
    _data['url'] = url;
    _data['forks_url'] = forksUrl;
    _data['keys_url'] = keysUrl;
    _data['collaborators_url'] = collaboratorsUrl;
    _data['teams_url'] = teamsUrl;
    _data['hooks_url'] = hooksUrl;
    _data['issue_events_url'] = issueEventsUrl;
    _data['events_url'] = eventsUrl;
    _data['assignees_url'] = assigneesUrl;
    _data['branches_url'] = branchesUrl;
    _data['tags_url'] = tagsUrl;
    _data['blobs_url'] = blobsUrl;
    _data['git_tags_url'] = gitTagsUrl;
    _data['git_refs_url'] = gitRefsUrl;
    _data['trees_url'] = treesUrl;
    _data['statuses_url'] = statusesUrl;
    _data['languages_url'] = languagesUrl;
    _data['stargazers_url'] = stargazersUrl;
    _data['contributors_url'] = contributorsUrl;
    _data['subscribers_url'] = subscribersUrl;
    _data['subscription_url'] = subscriptionUrl;
    _data['commits_url'] = commitsUrl;
    _data['git_commits_url'] = gitCommitsUrl;
    _data['comments_url'] = commentsUrl;
    _data['issue_comment_url'] = issueCommentUrl;
    _data['contents_url'] = contentsUrl;
    _data['compare_url'] = compareUrl;
    _data['merges_url'] = mergesUrl;
    _data['archive_url'] = archiveUrl;
    _data['downloads_url'] = downloadsUrl;
    _data['issues_url'] = issuesUrl;
    _data['pulls_url'] = pullsUrl;
    _data['milestones_url'] = milestonesUrl;
    _data['notifications_url'] = notificationsUrl;
    _data['labels_url'] = labelsUrl;
    _data['releases_url'] = releasesUrl;
    _data['deployments_url'] = deploymentsUrl;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pushed_at'] = pushedAt;
    _data['git_url'] = gitUrl;
    _data['ssh_url'] = sshUrl;
    _data['clone_url'] = cloneUrl;
    _data['svn_url'] = svnUrl;

    _data['size'] = size;
    _data['stargazers_count'] = stargazersCount;
    _data['watchers_count'] = watchersCount;
    _data['language'] = language;
    _data['has_issues'] = hasIssues;
    _data['has_projects'] = hasProjects;
    _data['has_downloads'] = hasDownloads;
    _data['has_wiki'] = hasWiki;
    _data['has_pages'] = hasPages;
    _data['forks_count'] = forksCount;

    _data['archived'] = archived;
    _data['disabled'] = disabled;
    _data['open_issues_count'] = openIssuesCount;

    _data['allow_forking'] = allowForking;
    _data['is_template'] = isTemplate;
    _data['topics'] = topics;
    _data['visibility'] = visibility;
    _data['forks'] = forks;
    _data['open_issues'] = openIssues;
    _data['watchers'] = watchers;
    _data['default_branch'] = defaultBranch;
    return _data;
  }
}

class Owner {
  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });
  late final String login;
  late final int id;
  late final String nodeId;
  late final String avatarUrl;
  late final String gravatarId;
  late final String url;
  late final String htmlUrl;
  late final String followersUrl;
  late final String followingUrl;
  late final String gistsUrl;
  late final String starredUrl;
  late final String subscriptionsUrl;
  late final String organizationsUrl;
  late final String reposUrl;
  late final String eventsUrl;
  late final String receivedEventsUrl;
  late final String type;
  late final bool siteAdmin;

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['avatar_url'] = avatarUrl;
    _data['gravatar_id'] = gravatarId;
    _data['url'] = url;
    _data['html_url'] = htmlUrl;
    _data['followers_url'] = followersUrl;
    _data['following_url'] = followingUrl;
    _data['gists_url'] = gistsUrl;
    _data['starred_url'] = starredUrl;
    _data['subscriptions_url'] = subscriptionsUrl;
    _data['organizations_url'] = organizationsUrl;
    _data['repos_url'] = reposUrl;
    _data['events_url'] = eventsUrl;
    _data['received_events_url'] = receivedEventsUrl;
    _data['type'] = type;
    _data['site_admin'] = siteAdmin;
    return _data;
  }
}
