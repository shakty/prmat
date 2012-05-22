function [agents_pos] = initial_pos_clustered(nof_clusters,clusterTightness,n_agents,ideas_space_size,ideas_space_dim)

    % Agents are positioned randomly across the whole idea space
    if (nof_clusters==0)
        agents_pos = ideas_space_size.*rand(ideas_space_dim,n_agents);
    
    % Clusters are created
    else
        centers = ideas_space_size.*rand(ideas_space_dim,nof_clusters); %uniformly distributed random centers of the clusters
        radii = (ideas_space_dim/nof_clusters).*rand(1,nof_clusters);   %uniformly distributed random radii of the clusters

        agents_in_clusters = zeros(1,nof_clusters);

        %"assign" agents to a random cluster
        for i=1:n_agents
           a=randi(nof_clusters);
           agents_in_clusters(a)=agents_in_clusters(a)+1;
        end

        agents_pos=[];

        for i=1:nof_clusters
            %for every cluster, randomly (normally distributed) distribute the
            %corresponding agents around the center of the cluster, more or
            %less within the calculated radius
            agents_pos = [agents_pos, clusterTightness*radii(i)*randn(ideas_space_dim,agents_in_clusters(i)) ... 
                            + repmat(centers(:,i),1,agents_in_clusters(i))];

            %in case agents are positioned outside of feasible area: 
            %position them on the border
            lt0 = find(agents_pos(:,(end-agents_in_clusters(i)+1):end) < 0);
            agents_pos(lt0)=0;
            gts = find(agents_pos(:,(end-agents_in_clusters(i)+1):end) > ideas_space_size);
            agents_pos(gts)=ideas_space_size;                    
        end
    end
end